From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5 00/13] gpio: Tight IRQ chip integration
Date: Mon, 23 Oct 2017 09:47:08 +0100
Message-ID: <a71b5600-dc22-c53a-7909-48e39c8cf3e6@nvidia.com>
References: <20171013154913.29448-1-thierry.reding@gmail.com>
 <f25cd66f-1382-8007-9744-0dbd72757163@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f25cd66f-1382-8007-9744-0dbd72757163-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Linus,

On 16/10/17 19:09, Jon Hunter wrote:
> Hi Linus,
> 
> On 13/10/17 16:49, Thierry Reding wrote:
>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Hi Linus,
>>
>> here's the latest series of patches that implement the tighter IRQ chip
>> integration. I've dropped the banked infrastructure for now as per the
>> discussion with Grygorii.
>>
>> The first couple of patches are mostly preparatory work in order to
>> consolidate all IRQ chip related fields in a new structure and create
>> the base functionality for adding IRQ chips.
>>
>> After that, I've added the Tegra186 GPIO support patch that makes use of
>> the new tight integration.
> 
> I have reviewed this series and tested on Tegra, so for the series ...
> 
> Reviewed-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Tested-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> We would really like to get support for Tegra186 GPIO in v4.15, so
> please let us know if you think that this is do-able.

Any feedback/comments?

Thanks
Jon

-- 
nvpublic
