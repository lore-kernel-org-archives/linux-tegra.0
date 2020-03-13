From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [Patch V5 00/21] Tegra XUSB OTG support
Date: Fri, 13 Mar 2020 10:18:23 +0530
Message-ID: <3e76c44e-f2b0-3c8a-c7b3-0461ff1176d3@ti.com>
References: <1581322307-11140-1-git-send-email-nkristam@nvidia.com>
 <20200217085130.GJ1339021@ulmo> <20200227173226.GA1114616@ulmo>
 <20200304070100.GA1271591@kroah.com> <20200312092232.GA1199023@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200312092232.GA1199023@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On 12/03/20 2:52 pm, Thierry Reding wrote:
> On Wed, Mar 04, 2020 at 08:01:00AM +0100, Greg Kroah-Hartman wrote:
>> On Thu, Feb 27, 2020 at 06:32:26PM +0100, Thierry Reding wrote:
>>> On Mon, Feb 17, 2020 at 09:51:30AM +0100, Thierry Reding wrote:
>>>> On Mon, Feb 10, 2020 at 01:41:26PM +0530, Nagarjuna Kristam wrote:
>>>>> This patch series adds OTG support on XUSB hardware used in Tegra210 and
>>>>> Tegra186 SoCs.
>>>>>
>>>>> This patchset is composed with :
>>>>>  - dt bindings of XUSB Pad Controller
>>>>>  - dt bindings for XUSB device Driver
>>>>>  - Tegra PHY driver for usb-role-switch and usb-phy
>>>>>  - Tegra XUSB host mode driver to support OTG mode
>>>>>  - Tegra XUSB device mode driver to use usb-phy and multi device mode
>>>>>  - dts for XUSB pad controller
>>>>>  - dts for xudc for Jetson TX1 and TX2
>>>>>  - dts for Jetson-TK1
>>>>>  - dts for Jetson-Nano
>>>>>
>>>>> Tegra Pad controller driver register for role switch updates for
>>>>> OTG/peripheral capable USB ports and adds usb-phy for that corresponding
>>>>> USB ports.
>>>>>
>>>>> Host and Device mode drivers gets usb-phy from USB2's phy and registers
>>>>> notifier for role changes to perform corresponding role tasks.
>>>>>
>>>>> Order of merging Patches:
>>>>> Please merge DT changes first followed Tegra PHY driver changes and then
>>>>> USB driver changes.
>>>>
>>>> Felipe, Greg, Kishon,
>>>>
>>>> Given the runtime dependencies between these various parts, I could pick
>>>> these up into the Tegra tree if you provide an Acked-by.
>>>
>>> Ping. Are you guys okay if I pick these up into the Tegra tree?
>>
>> That's up to Felipe, I have no opinion :)
> 
> Felipe, Kishon,
> 
> I've picked up the device tree changes into the Tegra tree. Let me know
> if you also want me to pick up the USB and PHY driver changes.

The PHY and USB changes can only go together since xhci-tegra.c seems to
use an export symbol of xusb PHY. So I'm fine if someone takes the PHY
changes along with USB changes.

Acked-by: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>

Thanks
Kishon
