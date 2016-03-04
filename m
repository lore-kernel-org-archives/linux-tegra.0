From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] arm64: tegra210-smaug: Add gpio-key nodes
Date: Fri, 4 Mar 2016 11:51:12 -0500
Message-ID: <56D9BD00.3080005@nvidia.com>
References: <1457034865-17826-1-git-send-email-rklein@nvidia.com>
 <20160304084729.GB4038@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160304084729.GB4038@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 3/4/2016 3:47 AM, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Thu, Mar 03, 2016 at 02:54:25PM -0500, Rhyland Klein wrote:
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> [...]
>> +		lid {
>> +			label = "Lid";
>> +			gpios = <&gpio TEGRA_GPIO(B, 4) GPIO_ACTIVE_LOW>;
>> +			linux,input-type = <5>; /* EV_SW */
>> +			linux,code = <0>; /* SW_LID */
>> +			gpio-key,wakeup;
>> +		};
>> +
>> +		tablet_mode {
>> +			label = "Tablet Mode";
>> +			gpios = <&gpio TEGRA_GPIO(Z, 2) GPIO_ACTIVE_HIGH>;
>> +			linux,input-type = <5>; /* EV_SW */
>> +			linux,code = <1>; /* SW_TABLET_MODE */
>> +			gpio-key,wakeup;
>> +		};
> 
> Is there a way to trigger these on a DVT device? Power and volume
> controls work fine, but I haven't found a way to test these two.

First of all, thanks for catching the deprecated property and changes in
the input.h.

As for testing, both can be triggered with magnets. The lid switch is
near the camera on the top of the display. For me, the tablet-mode
sensor is around 1/3 up from the bottom (assuming camera is the top) on
the back side of the device. Not sure how that would line up for you
though...

-rhyland

-- 
nvpublic
