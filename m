From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] PM / devfreq: Add governor flags to clarify the
 features
Date: Mon, 13 Jul 2020 13:37:11 +0300
Message-ID: <746837bc-6734-3e52-453f-2b59bbca0230@gmail.com>
References: <20200713083113.5595-1-cw00.choi@samsung.com>
 <CGME20200713081944epcas1p22871b6d8a9455226e6cccd08ac0baa73@epcas1p2.samsung.com>
 <20200713083113.5595-3-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200713083113.5595-3-cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: leonard.crestez-3arQi8VN3Tc@public.gmane.org, lukasz.luba-5wv7dgnIgG8@public.gmane.org, enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, abel.vesa-3arQi8VN3Tc@public.gmane.org, chanwoo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

13.07.2020 11:31, Chanwoo Choi пишет:
> DEVFREQ supports the default governors like performance, powersave and also
> allows the devfreq driver to add their own governor like tegra30-devfreq.c
> according to their requirement. In result, some sysfs attributes are
> useful or not useful. Prior to that the user can access all sysfs attributes
> regardless of availability.
> 
> So, clarify the access permission of sysfs attributes according to governor.
> When adding the devfreq governor, can specify the available attribute
> information by using DEVFREQ_GOV_ATTR_* constant variable. The user can
> read or write the sysfs attributes in accordance to the specified attributes.
> 
> /* Devfreq governor flags for attributes and features */
> [Definition for sysfs attributes]
> - DEVFREQ_GOV_ATTR_GOVERNOR
> - DEVFREQ_GOV_ATTR_AVAIL_GOVERNORS
> - DEVFREQ_GOV_ATTR_AVAIL_FREQUENCIES
> - DEVFREQ_GOV_ATTR_CUR_FREQ
> - DEVFREQ_GOV_ATTR_TARGET_FREQ
> - DEVFREQ_GOV_ATTR_MIN_FREQ
> - DEVFREQ_GOV_ATTR_MAX_FREQ
> - DEVFREQ_GOV_ATTR_TRANS_STAT
> - DEVFREQ_GOV_ATTR_POLLING_INTERVAL
> - DEVFREQ_GOV_ATTR_TIMER
> 
> Also, the devfreq governor is able to have the specific flag as follows
> in order to implement the specific feature. For example, Devfreq allows
> user to change the governors on runtime via sysfs interface.
> But, if devfreq device uses 'passive' governor, don't allow user to change
> the governor. For this case, define the DEVFREQ_GOV_FLAT_IMMUTABLE
> and set it to flag of passive governor.
> 
> [Definition for governor flag]
> - DEVFREQ_GOV_FLAG_IMMUTABLE
> : If immutable flag is set, governor is never changeable to other governors.
> - DEVFREQ_GOV_FLAG_IRQ_DRIVEN
> : Devfreq core won't schedule polling work for this governor if value is set.
> 
> [Table of governor flag for devfreq governors]
> ------------------------------------------------------------------------------
>                       | simple    | perfor | power | user | passive | tegra30
> 		      | ondemand  | mance  | save  | space|         |
> ------------------------------------------------------------------------------
> governor              | O         | O      | O     | O    | O       | O
> available_governors   | O         | O      | O     | O    | O       | O
> available_frequencies | O         | O      | O     | O    | O       | O
> cur_freq              | O         | O      | O     | O    | O       | O
> target_freq           | O         | O      | O     | O    | O       | O
> min_freq              | O         | O      | O     | O    | O       | O
> max_freq              | O         | O      | O     | O    | O       | O
> trans_stat            | O         | O      | O     | O    | O       | O
>                       --------------------------------------------------------
> polling_interval      | O         | X      | X     | X    | X       | O
> timer                 | O         | X      | X     | X    | X       | X
> ------------------------------------------------------------------------------
> immutable             | X         | X      | X     | X    | O       | O
> interrupt_driven      | X(polling)| X      | X     | X    | X       | O (irq)
> ------------------------------------------------------------------------------
> 
> Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---

Hello, Chanwoo! I tested this series on NVIDIA Tegra30 and everything
working fine!

Reviewed-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Tested-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>


BTW, I'm curious what do you think about hiding the unsupported debugfs
attributes per-device instead of returning the -EACCES?
