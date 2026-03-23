

import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:philippines_rpcmb/philippines_rpcmb.dart';

class PhDropdown extends StatefulWidget {
  const PhDropdown({Key? key}) : super(key: key);

  @override
  State<PhDropdown> createState() => _PhDropdownState();
}

class _PhDropdownState extends State<PhDropdown> {
  Region? region;
  Province? province;
  Municipality? municipality;
  String? barangay;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Form(
          child: Column(
          
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center, 
                spacing: 10, 
                runSpacing: 4,
                children: [
                  HugeIcon(
                    icon: HugeIcons.strokeRoundedLocation01,
                    color: Colors.white,
                  ),
                  Text(
                    region?.regionName ?? 'Select Location',
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    province?.name ?? '',
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    municipality?.name ?? '',
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    barangay ?? '',
                    style: const TextStyle(color: Colors.white),
                  ),

                ],
              ),

              SizedBox(height: 30,),

              Theme(
                data: Theme.of(context).copyWith(
                  textTheme: TextTheme(
                    titleMedium: TextStyle(color: Theme.of(context).appBarTheme.backgroundColor,),
                  ),
                  hintColor: Colors.white,

                ),
                child: 
                  PhilippineRegionDropdownView(
                    onChanged: (Region? value) {
                      setState(() {
                        if (region != value) {
                          province = null;
                          municipality = null;
                          barangay = null;
                        }
                        region = value;
                      });
                    },
                    value: region,
                  ),
              ),
              
              Theme(
                data: Theme.of(context).copyWith(
                  textTheme: TextTheme(
                    titleMedium: TextStyle(color: Theme.of(context).appBarTheme.backgroundColor,), 
                  ),
                  hintColor: Colors.white,
                ),
                child: 
                  PhilippineProvinceDropdownView(
                    provinces: region?.provinces ?? [],
                    onChanged: (Province? value) {
                      setState(() {
                        if (province != value) {
                          municipality = null;
                          barangay = null;
                        }
                        province = value;
                      });
                    },
                    value: province,
                  ),
              ),
              
              Theme(
                data: Theme.of(context).copyWith(
                  textTheme: TextTheme(
                    titleMedium: TextStyle(color: Theme.of(context).appBarTheme.backgroundColor,), 
                  ),
                  hintColor: Colors.white,
                ),
                child: 
                  PhilippineMunicipalityDropdownView(
                    municipalities: province?.municipalities ?? [],
                    onChanged: (value) {
                      setState(() {
                        if (municipality != value) {
                          barangay = null;
                        }
                        municipality = value;
                      });
                    },
                    value: municipality,
                    
                  ),
              ),
              Theme(
                data: Theme.of(context).copyWith(
                  textTheme: TextTheme(
                    titleMedium: TextStyle(color: Theme.of(context).appBarTheme.backgroundColor,), 
                  ),
                  hintColor: Colors.white,
                ),
                child: 
                  PhilippineBarangayDropdownView(
                    barangays: municipality?.barangays ?? [],
                    onChanged: (value) {
                      setState(() {
                        barangay = value;
                      });
                    }
                  ),
              ),
              
              const SizedBox(
                height: 32,
              ),

              
            ],
          ),
        ),
      );
  }
}