From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH 0/3] drm/gk20a: support for reclocking
Date: Fri, 11 Jul 2014 09:41:48 +0200
Message-ID: <53BF953C.7030109@free.fr>
References: <1404977677-22248-1-git-send-email-acourbot@nvidia.com>
 <53BE61D9.4020202@nvidia.com> <53BF4102.6010807@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <53BF4102.6010807-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ken Adams <KAdams-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/07/2014 03:42, Alexandre Courbot wrote:
> On 07/10/2014 06:50 PM, Mikko Perttunen wrote:
>> Does GK20A itself have any kind of thermal protection capabilities?
>> Upstream SOCTHERM support is not yet available (though I have a driver
>> in my tree), so we are thinking of disabling CPU DVFS on boards that
>> don't have always-on active cooling for now. Same might be necessary for
>> GPU as well.
>
> There is a small thermal driver ( 
> https://android.googlesource.com/kernel/tegra/+/b445e5296764d18861a6450f6851f25b9ca59dee/drivers/video/tegra/host/gk20a/therm_gk20a.c 
> ) but it doesn't seem to do much. I believe that for Tegra we rely in 
> SOCTHERM instead, but maybe Ken could confirm?

Unless it changed a great deal, I reverse engineered most of the 
registers in this area (for the nv50), but some stuff didn't change that 
much and could be used straight away (temperature reading, sending IRQs 
on thresholds, auto downclocking when overheating). We are not really 
using those features on nouveau right now, we just poll on the 
temperature every second.

If we are moving to using the PMU for thermal monitoring, we can do the 
polling there and warn the userspace when the temperature is too high or 
if performance is insufficient / too much. I have part of the code for 
performance counters in PMU, it's dead simple.

Martin
