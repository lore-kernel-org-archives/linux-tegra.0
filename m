From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v5 00/13] gpio: Tight IRQ chip integration
Date: Thu, 26 Oct 2017 08:18:20 +0100
Message-ID: <42211eed-3996-b968-330c-36c6ca160e0b@nvidia.com>
References: <20171013154913.29448-1-thierry.reding@gmail.com>
 <f25cd66f-1382-8007-9744-0dbd72757163@nvidia.com>
 <a71b5600-dc22-c53a-7909-48e39c8cf3e6@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <a71b5600-dc22-c53a-7909-48e39c8cf3e6@nvidia.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Ping!

On 23/10/17 09:47, Jon Hunter wrote:
> Hi Linus,
> 
> On 16/10/17 19:09, Jon Hunter wrote:
>> Hi Linus,
>>
>> On 13/10/17 16:49, Thierry Reding wrote:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> Hi Linus,
>>>
>>> here's the latest series of patches that implement the tighter IRQ chip
>>> integration. I've dropped the banked infrastructure for now as per the
>>> discussion with Grygorii.
>>>
>>> The first couple of patches are mostly preparatory work in order to
>>> consolidate all IRQ chip related fields in a new structure and create
>>> the base functionality for adding IRQ chips.
>>>
>>> After that, I've added the Tegra186 GPIO support patch that makes use of
>>> the new tight integration.
>>
>> I have reviewed this series and tested on Tegra, so for the series ...
>>
>> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
>> Tested-by: Jon Hunter <jonathanh@nvidia.com>
>>
>> We would really like to get support for Tegra186 GPIO in v4.15, so
>> please let us know if you think that this is do-able.
> 
> Any feedback/comments?
> 
> Thanks
> Jon
> 

-- 
nvpublic
