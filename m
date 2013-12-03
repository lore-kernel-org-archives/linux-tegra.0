From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: tegra: Header file for pinctrl constants
Date: Tue, 03 Dec 2013 13:08:20 -0700
Message-ID: <529E3A34.4030206@wwwdotorg.org>
References: <1385992502-12771-1-git-send-email-ldewangan@nvidia.com> <20131202142522.GA17566@ulmo.nvidia.com> <529D745D.2070503@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <529D745D.2070503-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/02/2013 11:04 PM, Laxman Dewangan wrote:
> On Monday 02 December 2013 07:55 PM, Thierry Reding wrote:
>> * PGP Signed by an unknown key
>>
>> On Mon, Dec 02, 2013 at 07:25:01PM +0530, Laxman Dewangan wrote:
>>
> 
>> +
>> +/* Schmitt enable/disable */
>> +#define TEGRA_PIN_DRIVE_SCHMITT_DISABLE            0
>> +#define TEGRA_PIN_DRIVE_SCHMITT_ENABLE            1
>> These are all boolean, so I wonder if perhaps we should be simply
>> defining a single pair and reuse that in different contexts:
>>
>>     #define TEGRA_PIN_DISABLE    0
>>     #define TEGRA_PIN_ENABLE    1
>>
>> The property names should provide enough context for them to be used
>> unambiguously.
>>
>>
> 
> I can make generic ENABLE/DISABLE macro as you suggested but datasheet
> says as 0=NORMAL, 1 = TRISTATE. and that's why I kept name very near to
> the datasheet.

That documentation is relative to a specific field, whereas the
namespace for #defines is global. Hence, we may have to name #defines
using stricter rules than the TRM's field values, in order to make them
unambiguous.
