From: Sumit Gupta <sumitg@nvidia.com>
Subject: RE: [PATCH ] drivers/base: cacheinfo: remove warning in resume
Date: Fri, 2 Sep 2016 12:58:55 +0000
Message-ID: <8413522b34f64829a4e601015c76ee45@BGMAIL104.nvidia.com>
References: <1472455254-27692-1-git-send-email-sumitg@nvidia.com>
 <32ada52a-4d47-282a-ef10-33d3e32fbd52@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <32ada52a-4d47-282a-ef10-33d3e32fbd52@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Bibek Basu <bbasu@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Hi Sudeep,

Thank you for your comments.
> 
> I understand the warning we get but the patch is completely wrong.
> One it removes the feature of adding/removing the cache devices on cpu
> hotplug events. Have you tested your patch with simple cpu hotplug and seen no
> change before and after this change ?
> 

I referred other node "cpufreq" under "cpu" node and that was also not getting deleted when core goes down.
So, thought the behavior should be similar as entries are only used to read data and it won't change after boot.

> On 29/08/16 08:20, Sumit Gupta wrote:
> > CPU notifier is present for creating device entries for child node
> > "cache" under parent node "cpu" as per DT.
> 
> Again DT is only on few architectures not on all(e.g. x86)
> 
> > During resume from
> > suspend, while booting all non-boot CPU's, this notifier for adding
> > cache device gets called before cpu device is added by device_resume.
> > Because of this warning message of "parent should not be sleeping"
> > comes during resume.
> >
> 
> Yes that's correct and needs to be fixed. I have seen this but haven't
> spent much time to check in detail. It's harmless warning IMO.
> See the comment in the code too:"This is a fib. But we'll allow new
> children to be added below a resumed device, even if the device hasn't
> been completed yet"
> 
> CPU devices are special and they have separate hotplug paths. So we need
> to consider that for cpu devices and set is_prepared quite early.
> 
> > Removing the notifier to explicitly add/remove
> > cache device as CPU and cache device get
> > added/removed anyway as part of normal suspend
> > resume sequence.
> > dpm_resume_end - > dpm_resume -> device_resume
> >
> 
> Yes, but:
> 1. the caches objects are visible even when the cpu is offline
> 2. how is this handled for normal cpu-hotplug events ? This patch
>     breaks the existing feature.

Compared with x86 now and there even cpufreq is getting deleted. 
As per the comments, right behavior seems to be where cache entries should be created during core on and removed during core off in hotplug.
I will try to find other way of doing it. Also will see why cpufreq is not getting deleted as in x86.

> 
> > Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> > ---
> >  drivers/base/cacheinfo.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> > index e9fd32e91668..17d9c051a16f 100644
> > --- a/drivers/base/cacheinfo.c
> > +++ b/drivers/base/cacheinfo.c
> > @@ -544,8 +544,6 @@ static int __init cacheinfo_sysfs_init(void)
> >  			goto out;
> >  		}
> >  	}
> > -	__hotcpu_notifier(cacheinfo_cpu_callback, 0);
> > -
> >  out:
> >  	cpu_notifier_register_done();
> >  	return rc;
> >
> 
> --
> Regards,
> Sudeep
