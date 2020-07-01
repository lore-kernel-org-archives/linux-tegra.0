From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 27/37] interconnect: Relax requirement in
 of_icc_get_from_provider()
Date: Thu, 2 Jul 2020 02:41:03 +0300
Message-ID: <95f476ce-081d-a222-2b98-96e6f8217c30@gmail.com>
References: <20200609131404.17523-1-digetx@gmail.com>
 <20200609131404.17523-28-digetx@gmail.com>
 <3b410ea3-26d3-6f7a-213c-40dbabbde8d1@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3b410ea3-26d3-6f7a-213c-40dbabbde8d1-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

01.07.2020 20:10, Georgi Djakov пишет:
> Hi Dmitry,
> 
> On 6/9/20 16:13, Dmitry Osipenko wrote:
>> From: Artur Świgoń <a.swigon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>
>> This patch relaxes the condition in of_icc_get_from_provider() so that it
>> is no longer required to set #interconnect-cells = <1> in the DT. In case
>> of the devfreq driver for exynos-bus, #interconnect-cells is always zero.
>>
>> Signed-off-by: Artur Świgoń <a.swigon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> [digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org: added cells_num checking for of_icc_xlate_onecell()]
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> I have already applied the original patch by Artur, so please make the cells_num
> check a separate patch.

Okay, I'll update this patch! Thank you!
