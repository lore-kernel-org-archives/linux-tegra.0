From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC] i2c: device-tree: Handling child nodes which are not i2c
 devices
Date: Mon, 25 Apr 2016 09:51:35 -0600
Message-ID: <571E3D07.9040503@wwwdotorg.org>
References: <57110A35.2070509@nvidia.com> <571E2EE4.90104@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <571E2EE4.90104-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/25/2016 08:51 AM, Jon Hunter wrote:
> Hi all,
>
> Any thoughts on this? Let me know if this is not clear in anyway.

I'm not sure if you're expecting comment from me since I suggested 
option (1) below. For the record though I do think that's the better 
option; it's very general/explicit, should apply well to any OS 
environment, and relying on OF_POPULATED implies an order that the 
driver must initialize things in, so that it ensures OF_POPULATED is set 
before any I2C children are handled.

> On 15/04/16 16:35, Jon Hunter wrote:
>> Hi all,
>>
>> For Tegra we have an i2c device for display port, namely the display
>> port auxiliary channel (or dpaux) as specified by the display port
>> standard. If an design using Tegra does not utilise the display port
>> interface, then the pads assigned to the dpaux can be re-assigned to
>> another generic i2c controller (i2c6 for Tegra124/210). In other words,
>> the pads can be re-used for a generic i2c interface.
>>
>> The registers that control whether the pads are mapped to the dpaux or
>> i2c6 are located in the dpaux register space. Therefore, I am looking at
>> adding pin controller support for dpaux so that i2c6 can request these
>> pads if it is enabled and I was hoping to add a pinmux node the to dpaux
>> device in device-tree to do this. For example, something like ...
>>
>> 	dpaux@0,545c0000 {
>> 		...
>>
>> 		/* pinctrl node */
>> 		pinmux {
>> 			...
>> 		};
>> 	};
>>
>> Although the above works, when doing this I noticed that when the device
>> booted, I would seeing the following error messages on boot ...
>>
>>   i2c i2c-5: of_i2c: modalias failure on ...
>>
>> These error messages being caused by the new pinmux node because it is
>> not recognised as an i2c device. To avoid this error messages we have
>> come up with a couple solutions but wanted to get some feedback on the
>> best approach.
>>
>> 1. Add a i2c-bus sub-node to the dpaux binding (suggested by Stephen
>>     Warren), so we would have something like the below. Then i2c devices
>>     for dpaux would be place in the i2c-bus sub-node.
>>
>> 	dpaux@0,545c0000 {
>> 		...
>>
>> 		/* pinctrl node */
>> 		pinmux {
>> 			...
>> 		};
>>
>> 		/* place-holder for i2c devices */
>> 		i2c-bus {
>> 			...
>> 		};
>> 	};	
>>
>>     To make the above work ideally we would like to make the 'i2c-bus'
>>     node a generic solution for all i2c devices, so the i2c core would
>>     check for the presence of this node and if it is found then would
>>     default to this node for looking for i2c-devices.
>>
>> 2. When registering i2c devices via device-tree, the function
>>     of_i2c_register_devices() checks to see if OF_POPULATED flag is set
>>     for a given node. If it is set, then the node is skipped. I believe
>>     this was added for device-tree overlays (commit 4f001fd30145 i2c:
>>     Mark instantiated device nodes with OF_POPULATE). Another option is
>>     for the dpaux driver to mark the pinmux node as populated before
>>     registering the i2c adapter and this will prevent the i2c core from
>>     trying to parse the pinmux node. I am not sure if this would be
>>     frowned upon in anyway or if we can guarantee that no future changes
>>     to DT overlays would change this in a way where it would not work.
>>
>> Let me know your thoughts.
