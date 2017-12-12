From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 2/2] usb: chipidea: tegra: Select Tegra's PHY in
 Kconfig
Date: Tue, 12 Dec 2017 14:39:41 +0300
Message-ID: <37461928-a078-9247-ebad-c4a18fbd91ef@gmail.com>
References: <b820f290730e57c999c211e5f82cf833755c299f.1512947332.git.digetx@gmail.com>
 <d6b64530412955aba1284886b3f5f74e42d776da.1512947332.git.digetx@gmail.com>
 <20171211100400.GE10671@ulmo>
 <6dddb581-e708-b96e-cf56-f3bf106117e2@gmail.com>
 <20171212025444.GA22364@b29397-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171212025444.GA22364@b29397-desktop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Chen <hzpeterchen@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Felipe Balbi <balbi@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Hunter <jonathanh@nvidia.com>, Peter Chen <Peter.Chen@nxp.com>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 12.12.2017 05:54, Peter Chen wrote:
> On Mon, Dec 11, 2017 at 04:09:44PM +0300, Dmitry Osipenko wrote:
>> On 11.12.2017 13:04, Thierry Reding wrote:
>>> On Mon, Dec 11, 2017 at 02:10:00AM +0300, Dmitry Osipenko wrote:
>>>> UDC driver won't probe without Tegra's PHY, hence select it in the
>>>> Kconfig.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>> ---
>>>>  drivers/usb/chipidea/Kconfig | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/usb/chipidea/Kconfig b/drivers/usb/chipidea/Kconfig
>>>> index 785f0ed037f7..2ef3b27ea72b 100644
>>>> --- a/drivers/usb/chipidea/Kconfig
>>>> +++ b/drivers/usb/chipidea/Kconfig
>>>> @@ -27,6 +27,7 @@ config USB_CHIPIDEA_PCI
>>>>  config USB_CHIPIDEA_UDC
>>>>  	bool "ChipIdea device controller"
>>>>  	depends on USB_GADGET
>>>> +	select USB_TEGRA_PHY if ARCH_TEGRA
>>>
>>> This is kind of pointless given that USB_TEGRA_PHY originally was
>>> automatically enabled if ARCH_TEGRA was enabled.
>>
>> Again, please take a closer look at the patches. USB_TEGRA_PHY was enabled if
>> USB_EHCI_TEGRA was and not ARCH_TEGRA.
>>
>>> What do we gain by these two patches, other than maybe make the driver
>>> buildable as a module?
>>
>> Firstly, tegra-phy is built only if ehci-tegra is built.
>>
>> Secondly, I think we need to enforce Tegra PHY to be compiled as built-in if one
>> of ehci-tegra or chipidea drivers is built-in and the other is compiled as a module.
> 
> You may not bind controller driver with PHY driver in Kconfig, we need
> to make sure the controller driver has no build error if the PHY driver
> is not select. And if the PHY driver is not loaded, the controller
> driver should return -EPROBE_DEFER for it.

Okay, I'll drop the ChipIdea Kconfig patch and remove USB_TEGRA_PHY selection in
 USB_EHCI_TEGRA config entry in the next iteration of the patch. Also, I noticed
that USB_ULPI* selection should be moved from ehci-tegra to tegra-phy Kconfig entry.
