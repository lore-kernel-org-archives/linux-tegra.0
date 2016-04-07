From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [pinmux scripts PATCH] Add the Tegra210-smaug board
Date: Thu, 7 Apr 2016 14:45:08 -0600
Message-ID: <5706C6D4.8010007@wwwdotorg.org>
References: <1459978380-8574-1-git-send-email-rklein@nvidia.com>
 <5706C36E.6090305@wwwdotorg.org> <5706C4AB.4000108@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5706C4AB.4000108-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/07/2016 02:35 PM, Rhyland Klein wrote:
> On 4/7/2016 4:30 PM, Stephen Warren wrote:
>> On 04/06/2016 03:33 PM, Rhyland Klein wrote:
>>> Tegra210-smaug is the name for the Google Pixel C platform.
>>
>> I assume tegra210-smaug.dts is the DT filename that will appear in the
>> mainline kernel, and the board name that will appear in U-Boot if U-Boot
>> gets ported? In the past there have been disconnects between what Google
>> wanted to call boards and what NVIDIA called boards. I'd like to avoid
>> applying this and having to renaming everything later, if possible.
>
> Tegra210-smaug is the chosen kernel dt name for this board. That was
> approved by Google before posting to the kernel. I believe therefore
> that we should be fine to expect that name to be consistent between
> kernel/uboot/etc.

Great:-)

>> Does this table content match the production SW stack, and our Excel
>> pinmux spreadsheet?
>
> Right now this matches the production SW stack. It has some variances
> with the latest Excel pinmux spreadsheets, and I am working on trying to
> verify that these are correct vs those, or vice-versa.

OK, if it matches the existing SW, that's probably good enough to just 
apply this. Do you want me to wait for V2, or just go ahead and apply it 
now? I imagine it might take a while to track down the differences, and 
the production SW works, so the configuration it's using obviously at 
least works even if it isn't perfect...
