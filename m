From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: PM / devfreq: tegra30: Delete an error message in
 tegra_devfreq_probe()
Date: Sun, 5 Apr 2020 16:50:16 +0300
Message-ID: <2af3ed08-3607-9ecf-e092-fc126d2abeab@gmail.com>
References: <ba67e238-43a7-6c53-363e-7a2c12f09949@web.de>
 <27bdd09b-0b8d-a6ef-2ffd-53421277fcca@gmail.com>
 <72e2319e-9b9b-9045-c007-320b2be1e886@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <72e2319e-9b9b-9045-c007-320b2be1e886-S0/GAf8tV78@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Markus Elfring <Markus.Elfring-S0/GAf8tV78@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tang Bin <tangbin-0p4V/sDNsUmm0O/7XYngnFaTQe2KTcn/@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

05.04.2020 09:00, Markus Elfring пишет:
>> Reviewed-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Thanks for your positive feedback.
> 
> Will the logging of error codes need any more clarification
> around such function calls?

In general no, but it could be different for some (more complex) drivers.
