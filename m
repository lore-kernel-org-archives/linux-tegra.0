From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] PM / devfreq: Add governor flags to clarify the
 features
Date: Mon, 13 Jul 2020 17:26:43 +0300
Message-ID: <3c327421-0533-c657-1887-9036e525960d@gmail.com>
References: <20200713083113.5595-1-cw00.choi@samsung.com>
 <CGME20200713081944epcas1p22871b6d8a9455226e6cccd08ac0baa73@epcas1p2.samsung.com>
 <20200713083113.5595-3-cw00.choi@samsung.com>
 <746837bc-6734-3e52-453f-2b59bbca0230@gmail.com>
 <69ae2524-22d0-2444-da13-fae199392029@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <69ae2524-22d0-2444-da13-fae199392029-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: leonard.crestez-3arQi8VN3Tc@public.gmane.org, lukasz.luba-5wv7dgnIgG8@public.gmane.org, enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, abel.vesa-3arQi8VN3Tc@public.gmane.org, chanwoo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

13.07.2020 15:26, Chanwoo Choi пишет:
...
>> BTW, I'm curious what do you think about hiding the unsupported debugfs
> 
> Do you mean that sysfs?

Yes, sysfs :)

>> attributes per-device instead of returning the -EACCES?
> 
> I considered the hiding of sysfs node too instead of -EACCES.

If there is no real userspace (used by a non-developer crowd) that
relies on the attributes presence, then it could be fine to change the
behaviour, IMO.

I know that PowerTOP utility uses the 'trans_stat' attribute, but not
sure about the other attributes.

> But,
> For a long time, devfreq showed the sysfs interface of all devfreq devices
> regardless of the kind of devfreq governor. It means that devfreq keeps
> the ABI interface. If devfreq hides the unsupported sysfs node
> according to the type of governor, it will break the ABI.

I didn't notice that it's an ABI already [1]. Should be better not to
change the ABI if there is userspace already relying on the old
behaviour, otherwise it may be okay to make changes until it will be too
late, also given that this is still a "testing" ABI.

[1] https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-class-devfreq

Although, the doc doesn't say anything about -EACCES/-EINVAL, so isn't
it an ABI change already? Doesn't doc need to be updated in order to
reflect the ABI change?

For example, doc says that userspace shouldn't care about attribute
values which are irrelevant for a selected governor, like in the case of
the 'polling_interval' attribute. The doc doesn't say that userspace may
get a error.

> Although I knew that maybe performance/powersave/userspace didn't use
> the 'polling_interval' node, I just returned -EACCESS.

The 'polling_interval', 'min/max_freq' and the new 'timer' attributes
are all the governor attributes.

Would be nice to have a per-device `governor/` directory containing all
the governor-specific attributes (without the unrelated attributes), but
perhaps it's a bit too late to change it now?
