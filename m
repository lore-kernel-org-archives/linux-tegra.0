From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 3/5] drm/tegra: Trade overlay plane for cursor on older
 Tegra's
Date: Wed, 20 Dec 2017 23:28:50 +0300
Message-ID: <4cbdd5a3-bfff-3260-e044-9d62b18b8bd7@gmail.com>
References: <cover.1513783738.git.digetx@gmail.com>
 <fd0034ee935cc17915f4189ee65865c974f34d98.1513783739.git.digetx@gmail.com>
 <20171220201943.GF31757@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171220201943.GF31757@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 20.12.2017 23:19, Thierry Reding wrote:
> On Wed, Dec 20, 2017 at 06:46:12PM +0300, Dmitry Osipenko wrote:
>> Older Tegra's do not support RGBA format for the cursor, but instead
>> overlay plane could be used for it. Since there is no much use for the
>> overlays on a regular desktop and HW-accelerated cursor is much nicer
>> than the jerky SW cursor, let's trade one overlay plane for the cursor.
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/gpu/drm/tegra/dc.c | 75 +++++++++++++++++++++++++++++++++++-----------
>>  drivers/gpu/drm/tegra/dc.h |  2 ++
>>  2 files changed, 59 insertions(+), 18 deletions(-)
> 
> Given the dependency on the alpha formats patch and due to lack of time
> because of the holidays messing up the schedule I'd like to defer this
> to v4.17, unless we can settle all of it until Friday.

I'll rebase and re-test this patch on top of your "Implement legacy blending"
patch ASAP. I'm fine with the deferring if it won't workout well.
