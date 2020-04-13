From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 11/22] memory: tegra: Register as interconnect provider
Date: Mon, 13 Apr 2020 18:01:07 +0300
Message-ID: <8d8dd1aa-71b3-e090-5637-578e23150bf1@gmail.com>
References: <20200330010904.27643-1-digetx@gmail.com>
 <20200330010904.27643-12-digetx@gmail.com>
 <70f724d6-5cb2-0ebe-ffc1-5dbb77d9dc74@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <70f724d6-5cb2-0ebe-ffc1-5dbb77d9dc74-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello Georgi,

13.04.2020 15:43, Georgi Djakov пишет:
...
>> +	if (IS_ENABLED(CONFIG_INTERCONNECT)) {
> 
> The interconnect framework can be also a module and the then the build will fail.

That's a good catch!

>> +		err = tegra_mc_interconnect_setup(mc);
> 
> Maybe register the interconnect provider as a platform sub-device instead?

The sub-device sound like a bit too much of hassle. I'm curious whether
we could try to make all the tegra-memory drivers modular, please let me
try..
