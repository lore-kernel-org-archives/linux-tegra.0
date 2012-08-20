From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: dt: tegra: harmony: add regulators
Date: Mon, 20 Aug 2012 22:52:10 +0530
Message-ID: <50327242.80103@nvidia.com>
References: <1345186799-18229-1-git-send-email-ldewangan@nvidia.com> <502E9B09.3080800@wwwdotorg.org> <502EA1AC.4090205@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <502EA1AC.4090205-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Saturday 18 August 2012 01:25 AM, Stephen Warren wrote:
> On 08/17/2012 01:27 PM, Stephen Warren wrote:
>> On 08/17/2012 12:59 AM, Laxman Dewangan wrote:
>>> Harmony uses a TPS6586x regulator. Instantiate this, and hook up a
>>> couple of fixed GPIO-controlled regulators too.
>>>
>>> Based on Ventana regulator patch by Stephen Warren<swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> and converted to Harmony.
>> Thanks, applied to Tegra's for-3.7/dt branch.
> Oh hang on, this adds regulators to DT, but doesn't do anything to
> remove the board-file registration of Harmony's regulators from
> board-dt-tegra20.c, which end up conflicting, and preventing the PCIe
> driver from being registered.
>
> So, this patch really wants to remove the legacy code to, but doing so
> will be problematic; to avoid runtime git bisect failures, we'd need to
> merge the regulator tree in first, or wait until next kernel release or
> something... Thoughts?

Why not just remove the regulator registration from board files along 
with the dt entry (in one patch). That will resolve the issue of bisect.
