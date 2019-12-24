From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 10/10] usb: chipidea: tegra: Add USB_TEGRA_PHY module
 to driver's dependencies
Date: Tue, 24 Dec 2019 07:21:28 +0300
Message-ID: <f549b1f8-bc36-1a79-2f8a-042c7ee5fb56@gmail.com>
References: <20191220015238.9228-1-digetx@gmail.com>
 <20191220015238.9228-11-digetx@gmail.com>
 <20191220035650.GC19921@b29397-desktop>
 <fb7dee6e-e645-fe45-126c-c5f1e280bc26@gmail.com>
 <20191223063958.GD19921@b29397-desktop>
 <1d2e3ea0-a7ff-3e83-57d1-05ffddb0da07@gmail.com>
 <VI1PR04MB5327ADFDE053ACA5ABAA85708B290@VI1PR04MB5327.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <VI1PR04MB5327ADFDE053ACA5ABAA85708B290@VI1PR04MB5327.eurprd04.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Chen <peter.chen@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Peter Geis <pgwipeout@gmail.com>
List-Id: linux-tegra@vger.kernel.org

24.12.2019 05:54, Peter Chen пишет:
>  
>>
>> 23.12.2019 09:40, Peter Chen пишет:
>>> On 19-12-20 07:31:08, Dmitry Osipenko wrote:
>>>> 20.12.2019 06:56, Peter Chen пишет:
>>>>> On 19-12-20 04:52:38, Dmitry Osipenko wrote:
>>>>>> Now, when ci_hdrc_tegra kernel module is loaded, the phy_tegra_usb
>>>>>> module is loaded too regardless of kernel's configuration.
>>>>>> Previously this problem was masked because Tegra's EHCI driver is
>>>>>> usually enabled in kernel's config and thus PHY driver was getting
>>>>>> loaded because of it, but now I was making some more thorough
>>>>>> testing and noticed that PHY's module isn't getting auto-loaded without the
>> host driver.
>>>>>>
>>>>>> Note that ChipIdea's driver doesn't use any of the exported
>>>>>> functions of phy_tegra_usb module and thus the module needs to be
>> requested explicitly.
>>>>>>
>>>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>>>> ---
>>>>>>  drivers/usb/chipidea/Kconfig         | 1 +
>>>>>>  drivers/usb/chipidea/ci_hdrc_tegra.c | 6 ++++++
>>>>>>  2 files changed, 7 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/usb/chipidea/Kconfig
>>>>>> b/drivers/usb/chipidea/Kconfig index ae850b3fddf2..d53db520e209
>>>>>> 100644
>>>>>> --- a/drivers/usb/chipidea/Kconfig
>>>>>> +++ b/drivers/usb/chipidea/Kconfig
>>>>>> @@ -7,6 +7,7 @@ config USB_CHIPIDEA
>>>>>>  	select RESET_CONTROLLER
>>>>>>  	select USB_ULPI_BUS
>>>>>>  	select USB_ROLE_SWITCH
>>>>>> +	select USB_TEGRA_PHY if ARCH_TEGRA
>>>>>>  	help
>>>>>>  	  Say Y here if your system has a dual role high speed USB
>>>>>>  	  controller based on ChipIdea silicon IP. It supports:
>>>>>> diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c
>>>>>> b/drivers/usb/chipidea/ci_hdrc_tegra.c
>>>>>> index 7455df0ede49..8bc11100245d 100644
>>>>>> --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
>>>>>> +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
>>>>>> @@ -53,6 +53,12 @@ static int tegra_udc_probe(struct platform_device
>> *pdev)
>>>>>>  	struct tegra_udc *udc;
>>>>>>  	int err;
>>>>>>
>>>>>> +	if (IS_MODULE(CONFIG_USB_TEGRA_PHY)) {
>>>>>> +		err = request_module("phy_tegra_usb");
>>>>>> +		if (err)
>>>>>> +			return err;
>>>>>> +	}
>>>>>> +
>>>>>
>>>>> Why you do this dependency, if this controller driver can't get USB
>>>>> PHY, it should return error. What's the return value after calling
>>>>> below:
>>>>>
>>>>> 	udc->phy = devm_usb_get_phy_by_phandle(&pdev->dev, "nvidia,phy",
>>>>> 0);
>>>>
>>>> It returns -EPROBE_DEFER when phy_tegra_usb isn't loaded.
>>>>
>>>> So if you'll do:
>>>>
>>>> # rmmod ci_hdrc_tegra; rmmod ci_hdrc; rmmod phy_tegra_usb; # modprobe
>>>> ci_hdrc_tegra # lsmod
>>>> Module                  Size  Used by
>>>> ci_hdrc_tegra          16384  0
>>>> ci_hdrc                45056  1 ci_hdrc_tegra
>>>>
>>>> After this patch:
>>>>
>>>> # rmmod ci_hdrc_tegra; rmmod ci_hdrc; rmmod phy_tegra_usb; # modprobe
>>>> ci_hdrc_tegra # lsmod
>>>> Module                  Size  Used by
>>>> Module                  Size  Used by
>>>> phy_tegra_usb          20480  1
>>>> ci_hdrc_tegra          16384  0
>>>> ci_hdrc                45056  1 ci_hdrc_tegra
>>>
>>> I wonder why the driver needs such dependency? If there are two phy
>>> drivers could work with this controller driver, you may request two
>>> modules.
>>
>> Well, if somebody wants to use some PHY driver other than the upstream's
>> standard one, then that person could simply load the custom driver module first,
>> such that it will bind to the PHY's device first.
>>
>> It is also possible to manually unbind the standard driver from PHY's device and
>> then bind whatever driver you want.
>>
>>> Doesn't such dependency should be done by the board level script?
>>
>> This patch only improves the default behaviour that is common for all NVIDIA Tegra
>> boards, it doesn't prevent from doing any special customizations.
>>
>> Perhaps the Kconfig change could be dropped from this patch in order to provide a
>> bit more flexibility in regards to kernel's configuration, but I'm very doubtful that
>> realistically anyone would want to replace the default driver with anything else on
>> Tegra. The Kconfig change also puts ChipIdea's UDC driver in line with the Tegra's
>> EHCI driver that selects USB_TEGRA_PHY, please see drivers/usb/host/Kconfig.
>>
>>> Do you know are there any other drivers do such things?
>>
>> I don't think that any of the USB host drivers are currently doing such things, but in
>> general there are quite a lot of drivers in kernel that are using request_module [1].
>>
>> [1]
>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.c
>> om%2Flinux%2Flatest%2Fident%2Frequest_module&amp;data=02%7C01%7Cpete
>> r.chen%40nxp.com%7Ca153b9e4d81044cde3c108d787ccdcb9%7C686ea1d3bc2b
>> 4c6fa92cd99c5c301635%7C0%7C0%7C637127186257612269&amp;sdata=xOVnn
>> bVGRVhypbiMWpt2MUfcYayAl4ywpCa7xOAQ1vk%3D&amp;reserved=0
>>
>> Please note that drivers/usb/host/ehci-tegra.c uses exported symbols from
>> usb/phy/phy-tegra-usb.c and that is why the EHCI driver doesn't need to explicitly
>> load the phy_tegra_usb module, the load happens automatically because of the
>> missing symbols.
>>
>> Also, please note that it is possible to squash the Tegra EHCI driver into
>> ci_hdrc_tegra.c and then the explicit dependency on the phy_tegra_usb won't be
>> needed anymore since it will be replaced with an implicit dependency. We (me and
>> Peter Geis) already had some experimental patches that do the successful
>> squashing of the drivers, but looks like Peter got sidetracked for a more important
>> things for now, we'll probably return to that work later on.
> 
> Hi Dmitry,
> 
> Thanks for explaining it.  In fact, your case is very common for USB since PHY driver
> and controller driver are two independent drivers.  If you have no other ways
> to fix this dependency issue, it is ok to add it at driver.

Hello Peter,

For now I'm not aware of any alternatives to this patch, thanks.

BTW, I'll make a v3 of this series because found more things that could
be improved in the Tegra's PHY driver.
