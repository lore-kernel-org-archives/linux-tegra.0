From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 05/22] dt-bindings: host1x: Document new interconnect
 properties
Date: Fri, 10 Apr 2020 21:28:22 +0300
Message-ID: <98d28983-0c50-1155-adc0-8ddbd15cc701@gmail.com>
References: <20200330010904.27643-1-digetx@gmail.com>
 <20200330010904.27643-6-digetx@gmail.com> <20200410170929.GA1498@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200410170929.GA1498@bogus>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

10.04.2020 20:09, Rob Herring пишет:
...
>> +  Optional properties:
>> +  - interconnects: Must contain entry for the MPE memory clients.
>> +  - interconnect-names: Must include name of the interconnect path for each
>> +    interconnect entry. Consult TRM documentation for information about
>> +    available memory clients.
> 
> Is the TRM public? Perhaps refer to the header.

Yes, you can download it from NVIDIA website (after registration).

I'll add "Consult Memory Controller section of TRM..." in the next version.
