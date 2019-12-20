From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 10/10] usb: chipidea: tegra: Add USB_TEGRA_PHY module
 to driver's dependencies
Date: Fri, 20 Dec 2019 07:31:08 +0300
Message-ID: <fb7dee6e-e645-fe45-126c-c5f1e280bc26@gmail.com>
References: <20191220015238.9228-1-digetx@gmail.com>
 <20191220015238.9228-11-digetx@gmail.com>
 <20191220035650.GC19921@b29397-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191220035650.GC19921@b29397-desktop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Chen <peter.chen@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

20.12.2019 06:56, Peter Chen пишет:
> On 19-12-20 04:52:38, Dmitry Osipenko wrote:
>> Now, when ci_hdrc_tegra kernel module is loaded, the phy_tegra_usb module
>> is loaded too regardless of kernel's configuration. Previously this
>> problem was masked because Tegra's EHCI driver is usually enabled in
>> kernel's config and thus PHY driver was getting loaded because of it, but
>> now I was making some more thorough testing and noticed that PHY's module
>> isn't getting auto-loaded without the host driver.
>>
>> Note that ChipIdea's driver doesn't use any of the exported functions of
>> phy_tegra_usb module and thus the module needs to be requested explicitly.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/usb/chipidea/Kconfig         | 1 +
>>  drivers/usb/chipidea/ci_hdrc_tegra.c | 6 ++++++
>>  2 files changed, 7 insertions(+)
>>
>> diff --git a/drivers/usb/chipidea/Kconfig b/drivers/usb/chipidea/Kconfig
>> index ae850b3fddf2..d53db520e209 100644
>> --- a/drivers/usb/chipidea/Kconfig
>> +++ b/drivers/usb/chipidea/Kconfig
>> @@ -7,6 +7,7 @@ config USB_CHIPIDEA
>>  	select RESET_CONTROLLER
>>  	select USB_ULPI_BUS
>>  	select USB_ROLE_SWITCH
>> +	select USB_TEGRA_PHY if ARCH_TEGRA
>>  	help
>>  	  Say Y here if your system has a dual role high speed USB
>>  	  controller based on ChipIdea silicon IP. It supports:
>> diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
>> index 7455df0ede49..8bc11100245d 100644
>> --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
>> +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
>> @@ -53,6 +53,12 @@ static int tegra_udc_probe(struct platform_device *pdev)
>>  	struct tegra_udc *udc;
>>  	int err;
>>  
>> +	if (IS_MODULE(CONFIG_USB_TEGRA_PHY)) {
>> +		err = request_module("phy_tegra_usb");
>> +		if (err)
>> +			return err;
>> +	}
>> +
> 
> Why you do this dependency, if this controller driver can't
> get USB PHY, it should return error. What's the return value
> after calling below:
> 
> 	udc->phy = devm_usb_get_phy_by_phandle(&pdev->dev, "nvidia,phy", 0);

It returns -EPROBE_DEFER when phy_tegra_usb isn't loaded.

So if you'll do:

# rmmod ci_hdrc_tegra; rmmod ci_hdrc; rmmod phy_tegra_usb;
# modprobe ci_hdrc_tegra
# lsmod
Module                  Size  Used by
ci_hdrc_tegra          16384  0
ci_hdrc                45056  1 ci_hdrc_tegra

After this patch:

# rmmod ci_hdrc_tegra; rmmod ci_hdrc; rmmod phy_tegra_usb;
# modprobe ci_hdrc_tegra
# lsmod
Module                  Size  Used by
Module                  Size  Used by
phy_tegra_usb          20480  1
ci_hdrc_tegra          16384  0
ci_hdrc                45056  1 ci_hdrc_tegra
