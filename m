From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 08/22] drm/tegra: dc: Drop the reset asserts to workaround
 a bug
Date: Tue, 13 Jun 2017 17:18:37 +0300
Message-ID: <8d131ad2-5d1a-635e-4a6c-73b69cbf8e72@gmail.com>
References: <cover.1495498184.git.digetx@gmail.com>
 <35e1ef44da98701b2c507c31ecc0812530303d2d.1495498184.git.digetx@gmail.com>
 <20170613134546.GH16758@ulmo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170613134546.GH16758-m5CkvRiFyV9wFLYp8hBm2A@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 13.06.2017 16:45, Thierry Reding wrote:
> On Tue, May 23, 2017 at 03:14:23AM +0300, Dmitry Osipenko wrote:
>> Commit 33a8eb8 ("Implement runtime PM") introduced HW reset control. It
>> causes a hang on Tegra20 if both display controllers are utilized (RGB
>> panel and HDMI). The TRM suggests that each display controller has its own
>> reset control, apparently it is not correct. Let's remove the interaction
>> with the resets for now as a workaround.
>>
>> Fixes: 33a8eb8d40ee ("drm/tegra: dc: Implement runtime PM")
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/gpu/drm/tegra/dc.c | 15 ---------------
>>  1 file changed, 15 deletions(-)
> 
> Do you mind if I parameterize this to restrict omission of the assert
> and deassert to Tegra20? I'm fairly sure that these resets are important
> on later chips in order to properly reset the display controllers.

I don't mind at all, I can parameterize it in the next rev myself if you wish.

> My proposal would be to add a field to struct tegra_dc_soc_info (maybe
> .broken_reset) that will be set only on Tegra20 to still allow the DC to
> be reset on later generations.

Sounds good.

-- 
Dmitry
