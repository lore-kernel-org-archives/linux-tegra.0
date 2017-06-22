From: jeffy <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [RFC PATCH v3 3/6] ARM/arm64: dts: enable wakeup for cros-ec-spi
 devices
Date: Thu, 22 Jun 2017 10:33:47 +0800
Message-ID: <594B2C8B.3000401@rock-chips.com>
References: <1498039313-24220-1-git-send-email-jeffy.chen@rock-chips.com> <1498039313-24220-4-git-send-email-jeffy.chen@rock-chips.com> <CAJKOXPdL2CB9VWNo=it0dos-4hJYrgHUSZwcG1DS=9c+YxXzhQ@mail.gmail.com> <594A91C9.1090906@rock-chips.com> <20170621153632.7cajs5xwdmhdm2fg@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170621153632.7cajs5xwdmhdm2fg@kozik-lap>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Krzysztof,

thanx for noting that, will add it to next version :)


On 06/21/2017 11:36 PM, Krzysztof Kozlowski wrote:
> On Wed, Jun 21, 2017 at 11:33:29PM +0800, jeffy wrote:
>> Hi Krzysztof,
>>
>> thanx for your comment.
>>
>> On 06/21/2017 06:45 PM, Krzysztof Kozlowski wrote:
>>> On Wed, Jun 21, 2017 at 12:01 PM, Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
>>>> We used to enable wakeup for cros-ec-spi devices unconditionally.
>>>> Now we are using the more generic wakeup-source property to enable it.
>>>
>>> Using wakeup-source property is still enabling this unconditionally.
>>> What  do you exactly mean here?
>> i mean the wakeup-source is an optional property, we can disable wakeup by
>> not adding it.
>
> Maybe mention this in commit msg? This removes any confusion. "Till now
> the driver always enabled wakeup but now it supports wakeup property so
> add it to keep same functionality."
>
> Best regards,
> Krzysztof
>
>
>
>
