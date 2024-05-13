import 'package:flutter/material.dart';
import 'package:shopify/utils/constants/sizes.dart';

class addnewaddress extends StatelessWidget {
  const addnewaddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new Addresss"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Tsizes.defaultspace),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.supervised_user_circle,),labelText: "Name"
                  ),
                ),
                const SizedBox(height: Tsizes.spacebetweenitems,),
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone,),labelText: "Phone Number"
                  ),
                ),
                const SizedBox(height: Tsizes.spacebetweenitems,),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.home,),labelText: "Street"
                        ),
                      ),
                    ),
                    const SizedBox(width: Tsizes.spacebetweenitems,),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.pin_drop_outlined,),labelText: "pincode"
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Tsizes.spacebetweenitems,),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.home_work_outlined,),labelText: "City"
                        ),
                      ),
                    ),
                    const SizedBox(width: Tsizes.spacebetweenitems,),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.reduce_capacity,),labelText: "State"
                        ),
                      ),
                    ),

                  ],
                ),
                const SizedBox(height: Tsizes.spacebetweenitems,),
                TextFormField(
                  decoration: const InputDecoration(prefixIcon: Icon(Icons.vpn_lock_sharp),labelText: "Country"),
                ),
                const SizedBox(height: Tsizes.defaultspace,),
                SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){},child: const Text("Save"),),)


              ],
            ),
          ),
        ),
      ),
    );
  }
}
