From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: tegra: Header file for pinctrl constants
Date: Wed, 4 Dec 2013 11:19:48 +0530
Message-ID: <529EC27C.6030003@nvidia.com>
References: <1385992502-12771-1-git-send-email-ldewangan@nvidia.com> <20131202142522.GA17566@ulmo.nvidia.com> <529D745D.2070503@nvidia.com> <529E3A34.4030206@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <529E3A34.4030206-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 04 December 2013 01:38 AM, Stephen Warren wrote:
> On 12/02/2013 11:04 PM, Laxman Dewangan wrote:
>> On Monday 02 December 2013 07:55 PM, Thierry Reding wrote:
>>> * PGP Signed by an unknown key
>>>
>>> On Mon, Dec 02, 2013 at 07:25:01PM +0530, Laxman Dewangan wrote:
>>>
>>> +
>>> +/* Schmitt enable/disable */
>>> +#define TEGRA_PIN_DRIVE_SCHMITT_DISABLE            0
>>> +#define TEGRA_PIN_DRIVE_SCHMITT_ENABLE            1
>>> These are all boolean, so I wonder if perhaps we should be simply
>>> defining a single pair and reuse that in different contexts:
>>>
>>>      #define TEGRA_PIN_DISABLE    0
>>>      #define TEGRA_PIN_ENABLE    1
>>>
>>> The property names should provide enough context for them to be used
>>> unambiguously.
>>>
>>>
>> I can make generic ENABLE/DISABLE macro as you suggested but datasheet
>> says as 0=NORMAL, 1 = TRISTATE. and that's why I kept name very near to
>> the datasheet.
> That documentation is relative to a specific field, whereas the
> namespace for #defines is global. Hence, we may have to name #defines
> using stricter rules than the TRM's field values, in order to make them
> unambiguous.

I send the V2 patches on which I have taken care of this.
Request you to please review.

Thanks,
Laxman
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
