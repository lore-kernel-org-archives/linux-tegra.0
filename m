From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: dts: tegra20: Remove obsolete vbus-gpio
 properties
Date: Wed, 26 Jun 2013 13:22:07 +0300
Message-ID: <op.wy9625kupdlnwf@mperttunen-lnx>
References: <1372240781-1017-1-git-send-email-mperttunen@nvidia.com>
 <1372240781-1017-5-git-send-email-mperttunen@nvidia.com>
 <20130626101758.GU12640@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130626101758.GU12640-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: "stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org" <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 26 Jun 2013 13:17:58 +0300, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote:

> * PGP Signed by an unknown key
>
> On Wed, Jun 26, 2013 at 12:59:41PM +0300, Mikko Perttunen wrote:
>> USB VBUS regulators are now specified with the vbus-supply property
>> instead of vbus-gpio, so remove the obsolete properties.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/tegra20-seaboard.dts  | 1 -
>>  arch/arm/boot/dts/tegra20-trimslice.dts | 1 -
>>  arch/arm/boot/dts/tegra20-whistler.dts  | 2 --
>>  3 files changed, 4 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/tegra20-seaboard.dts  
>> b/arch/arm/boot/dts/tegra20-seaboard.dts
>> index ab177b4..2ab4775 100644
>> --- a/arch/arm/boot/dts/tegra20-seaboard.dts
>> +++ b/arch/arm/boot/dts/tegra20-seaboard.dts
>> @@ -566,7 +566,6 @@
>>
>>  	usb@c5000000 {
>>  		status = "okay";
>> -		nvidia,vbus-gpio = <&gpio TEGRA_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
>
> silly question but don't you need to put a phandle to the VBUS regulator
> here ?
>

It's already there in the corresponding usb-phy node. They were added by
Venu Byravarasu in commit 4c94c8b5 "ARM: tegra: update device trees for
USB binding rework".
