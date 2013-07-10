From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2] ARM: tegra: enable gpio-keys on dalmore
Date: Wed, 10 Jul 2013 12:33:51 +0530
Message-ID: <51DD0757.8060406@nvidia.com>
References: <1373102069-5641-1-git-send-email-ldewangan@nvidia.com> <20130709060447.GA17499@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130709060447.GA17499@mithrandir>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 09 July 2013 11:34 AM, Thierry Reding wrote:
> * PGP Signed by an unknown key
>
> On Sat, Jul 06, 2013 at 02:44:29PM +0530, Laxman Dewangan wrote:
>> D
>> +
>> +		home {
>> +			label = "Home";
>> +			gpios = <&gpio TEGRA_GPIO(I, 5) GPIO_ACTIVE_LOW>;
>> +			linux,code = <102>; /* KEY_HOME */
> I wonder if these should maybe go into a header file as well so that
> symbolic names can be used. That'll make the value self-descriptive and
> allow the comment to be dropped.
>
Currently there is no header for input.h in dt-binding include. We need 
to add them first and then use it.
Probably it can be done along with all cleanups on dts file atleast for 
Tegra.
I can start this if no one faster than me for this activity but for this 
patch, I like to go on legacy way.
