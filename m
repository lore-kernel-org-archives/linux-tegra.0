From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH v3 0/3] Add support for Tegra210
Date: Mon, 23 Mar 2015 15:19:36 -0600
Message-ID: <55108368.8000606@wwwdotorg.org>
References: <1426897221-20307-1-git-send-email-jimmzhang@nvidia.com> <551076E2.9000408@wwwdotorg.org> <20150323211336.GB30637@mithrandir.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150323211336.GB30637-+E7KM1FDEuP5BGCcOMqoLIH6Mc4MB0Vx@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/23/2015 03:13 PM, Thierry Reding wrote:
> On Mon, Mar 23, 2015 at 02:26:10PM -0600, Stephen Warren wrote:
>> On 03/20/2015 06:20 PM, Jimmy Zhang wrote:
>>> Four t210 specific supporting files are added under src/t210 diretory.
>>> Comparing T210 bct to T132 bct, the main changes include the size increased
>>> to 10240 from 8704. The number of boot devices that can be specified in bct
>>> is reduced from 4 to 1. And many new fileds are added to nvboot_sdram_params.
>>>
>>> v1: Initial changes
>>> v2: Fix some minor issues found in v1
>>>      Removed files src/t210/nvboot_config.h and src/t210/sdram_param.h
>>>              that were added unintentionally in v1.
>>> v3: Remove "deprecated" from help -t option help text.
>>
>> I think this version looks fine. Barring any objections, I'll apply it Tue
>> my time sometime.
>
> I wasn't able to successfully dump a BCT using this series. I'm not sure
> if that's actually caused by a bad BCT or by the patches not being
> correct. Do we have canonical BCT sources somewhere for something like
> Foster?
>
> The problem I'm seeing is that bct_dump reports that the BCT contains 0
> SDRAM sets, whereas I'm pretty sure I've used the same BCT to bootstrap
> a device with tegrarcm, so it's got to have valid SDRAM sets defined. I
> can dig deeper, but it'd be good to have a reference BCT source and
> image to verify that converting to BCT and back to source actually is an
> idempotent operation.

OK, I'll hold off applying this until you've been able to use it 
successfully.

I did check that the patches compiled, and that tegra-uboot-flasher was 
able to build flash images for all existing boards, but didn't attempt 
to use the new SoC support.
