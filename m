From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 1/2] hwmon: (lm90) Add power control
Date: Wed, 11 Sep 2013 17:40:24 +0800
Message-ID: <52303A88.5050306@nvidia.com>
References: <20130909135022.GZ29403@sirena.org.uk> <20130909155043.GA18975@roeck-us.net> <20130909160237.GR29403@sirena.org.uk> <20130909161735.GC18975@roeck-us.net> <20130909203910.GV29403@sirena.org.uk> <522E9A85.9050803@nvidia.com> <522EA51C.90706@roeck-us.net> <522EB0AF.9030708@nvidia.com> <20130910101359.GX29403@sirena.org.uk> <522F02A4.7060702@nvidia.com> <20130910121157.GJ29403@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130910121157.GJ29403-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, "khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org" <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org" <lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 09/10/2013 08:11 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
> 
> On Tue, Sep 10, 2013 at 07:29:40PM +0800, Wei Ni wrote:
> 
>> On my platform, it use palmas-regulator.c, ldo6 for this lm90 power
>> rail. I checked this driver, it will handle ramp_delay except LDOx.
>> Since I'm not familiar with this palmas device and driver, so do you
>> mean I can set regulator-ramp-delay property in the DT for ldo6, but I
>> really don't know what value should I set :(
> 
> Laxman just submitted a patch adding the ramp delay information which I
> applied.  It seems like this is just a hack for your board and can
> therefore be removed?

Oh, yes, it seems the patches is Laxman's [PATCH 1/2] regulator: palmas:
configure enable time for LDOs.
Thanks, I will check it, and remove the delay in my next patch.

Wei.

> 
> * Unknown Key
> * 0x7EA229BD
> 
