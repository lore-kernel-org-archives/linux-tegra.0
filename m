From: Wambui Karuga <wambui.karugax-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 10/21] drm/tegra: remove checks for debugfs functions
 return value
Date: Wed, 11 Mar 2020 17:54:46 +0300 (EAT)
Message-ID: <alpine.LNX.2.21.99999.375.2003111750360.14786@wambui>
References: <20200227120232.19413-1-wambui.karugax@gmail.com> <20200227120232.19413-11-wambui.karugax@gmail.com> <20200311143753.GC494173@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200311143753.GC494173@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Wambui Karuga <wambui.karugax-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, daniel-/w4YWyX8dFk@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hey Thierry,

On Wed, 11 Mar 2020, Thierry Reding wrote:

> On Thu, Feb 27, 2020 at 03:02:21PM +0300, Wambui Karuga wrote:
>> Since 987d65d01356 (drm: debugfs: make
>> drm_debugfs_create_files() never fail) there is no need to check the
>> return value of drm_debugfs_create_files(). Therefore, remove the
>> return checks and error handling of the drm_debugfs_create_files()
>> function from various debugfs init functions in drm/tegra and have
>> them return 0 directly.
>>
>> This change also includes removing the use of drm_debugfs_create_files
>> as a return value in tegra_debugfs_init() and have the function declared
>> as void.
>>
>> Signed-off-by: Wambui Karuga <wambui.karugax-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/gpu/drm/tegra/dc.c   | 11 +----------
>>  drivers/gpu/drm/tegra/drm.c  |  8 ++++----
>>  drivers/gpu/drm/tegra/dsi.c  | 11 +----------
>>  drivers/gpu/drm/tegra/hdmi.c | 11 +----------
>>  drivers/gpu/drm/tegra/sor.c  | 11 +----------
>>  5 files changed, 8 insertions(+), 44 deletions(-)
>
> Applied, thanks.
>
There's a newer version[1] of this patch series as this specific patch 
depends on other work in drm.

Thanks,
wambui karuga.

[1] https://lists.freedesktop.org/archives/dri-devel/2020-March/258793.html
> Thierry
>
