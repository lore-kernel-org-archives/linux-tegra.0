From: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 0/6] Port Tegra to generic clk framework
Date: Thu, 5 Jul 2012 21:32:58 +0530
Message-ID: <4FF5BAB2.40007@nvidia.com>
References: <1341313761-22118-1-git-send-email-pgaikwad@nvidia.com> <4FF31DFC.8030708@wwwdotorg.org> <4FF3D6BD.1000509@nvidia.com> <4FF5B378.6030305@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FF5B378.6030305-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "mturquette-l0cyMroinI0@public.gmane.org" <mturquette-l0cyMroinI0@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thursday 05 July 2012 09:02 PM, Stephen Warren wrote:
> On 07/03/2012 11:38 PM, Prashant Gaikwad wrote:
>> On Tuesday 03 July 2012 09:59 PM, Stephen Warren wrote:
>>> On 07/03/2012 05:09 AM, Prashant Gaikwad wrote:
>>>> This patch set ports Tegra clock code to generic clock framework.
>>>>
>>>> Depends on
>>>> [PATCH v3 0/9] Add clk_prepare/clk_unprepare series
>>>> [PATCH] ARM: tegra: Remove second instance of uart clk
>>>> [PATCH] dma: tegra: add clk_prepare/clk_unprepare
>>>> [PATCH] ARM: tegra: dma: rename driver name for clock to "tegra-apbdma"
>>>>
>>>> Tested on Ventana and Cardhu
>>>>
>>>> v2:
>>>>    - Rebased on Tegra's for-3.6/common-clk
>>> OK, this applies to for-3.6/common-clk without issue now. However, there
>>> are still runtime problems:
>>>
>>> On Tegra20(Ventana), running Tegra's for-next branch with these patches
>>> merged in, if I play audio, the sound is much too low a pitch; the I2S
>>> clock must be being set too low. Also, if I play the same file twice,
>>> once encoded as 48KHz once encoded as 44.1KHz, the pitch is different.
>>>
>>> On Tegra20(Ventana), running next-20120703 plus a few local patches for
>>> regulators plus these common clock patches, then I see the same
>>> segfaults during boot that I mentioned before. It seems something in
>>> linux-next not in Tegra's for-next branch is breaking the common clock
>>> code for us.
>> Does these local patches include any changes in clock init table? Is it
>> possible to share the changes?
> My local dev branch is usually available at:
> git://nv-tegra.nvidia.com/user/swarren/linux-2.6 linux-next_common
>
> The local patches are mostly regulator support work-in-progress at the
> moment, so nothing to do with clocks, except one minor warning fix.
>
> I see you've posted v3; I assume that means you've found/fixed the
> issues - I'll go test.
I have fixed audio issue in v3. Another issue related to Tegra20 boot 
depends on the fix posted by Rajendra.
I have mentioned the dependency on the fix in v3.
