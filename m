From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 2/2] dt-bindings: firmware: tegra186-bpmp: Document
 interconnects property
Date: Mon, 27 Jan 2020 01:03:57 +0300
Message-ID: <f915949a-b46e-26fe-f103-fbc8d1fa3bb1@gmail.com>
References: <20200114181519.3402385-1-thierry.reding@gmail.com>
 <20200114181519.3402385-2-thierry.reding@gmail.com>
 <7aefac6c-092c-b5a6-2fa6-e283d2147fc3@linaro.org>
 <20200120150605.GA712203@ulmo>
 <57c37b3c-1473-d444-db59-8c6650241188@gmail.com>
 <20200121141027.GE899558@ulmo>
 <83d94918-bc01-131b-924c-9750767d3b29@linaro.org>
 <20200121155432.GA912205@ulmo>
 <ffc22502-0e7e-522c-543d-0e74cc25f4b1@gmail.com>
 <853bb7bd-8e04-38ac-d0d6-a958135a49be@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <853bb7bd-8e04-38ac-d0d6-a958135a49be-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

27.01.2020 00:56, Dmitry Osipenko пишет:
[snip]
> Thinking a bit more about how to define the ICC, I'm now leaning to a
> variant like this:
> 
> interconnects =
>     <&mc TEGRA186_MEMORY_CLIENT_BPMP &emc TEGRA_ICC_EMEM>,

>     <&mc TEGRA186_MEMORY_CLIENT_BPMPR>,
>     <&mc TEGRA186_MEMORY_CLIENT_BPMPW>,
>     <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAR>,
>     <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAW>;

I forgot that each ICC path should have SRC and DST, but you got the idea.

This should be a more correct variant:

	<&mc TEGRA186_MEMORY_CLIENT_BPMPR &mc TEGRA_ICC_MC>,
	<&mc TEGRA186_MEMORY_CLIENT_BPMPW &mc TEGRA_ICC_MC>,
	<&mc TEGRA186_MEMORY_CLIENT_BPMPDMAR &mc TEGRA_ICC_MC>,
	<&mc TEGRA186_MEMORY_CLIENT_BPMPDMAW &mc TEGRA_ICC_MC>;

> 
> interconnect-names = "dma-mem", "read", "write", "dma-read", "dma-write";
...
