From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] gpu: host1x: Enable Tegra186 syncpoint protection
Date: Sat, 19 Aug 2017 13:09:59 +0300
Message-ID: <0c3682ea-3faf-0f36-eec0-3b5cf49c855c@gmail.com>
References: <20170818161553.27597-1-mperttunen@nvidia.com>
 <20170818161553.27597-2-mperttunen@nvidia.com>
 <d6d10aec-3d2a-99b3-a23d-41147478f412@gmail.com>
 <5ff98485-e8ac-75e0-ca8f-3887f8593ec4@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5ff98485-e8ac-75e0-ca8f-3887f8593ec4-/1wQRMveznE@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 19.08.2017 11:10, Mikko Perttunen wrote:
[snip]
>>> +    host1x_hw_syncpt_set_protection(host, true);
>>
>> Is it really okay to force the protection? Maybe protection should be enabled
>> with a respect to CONFIG_TEGRA_HOST1X_FIREWALL? In that case we would have to
>> avoid software jobs validation for Tegra124+.
> 
> I don't quite get your comment. The hardware syncpt protection layer being
> enabled should never hurt - it doesn't mess with any valid jobs. It's also only
> on Tegra186 so I'm not sure where the Tegra124 comes from.

Right, it's the gather filter on T124+, my bad. This raises several questions.

1) Why we have CONFIG_TEGRA_HOST1X_FIREWALL? Should it be always enforced or we
actually want to be a bit more flexible and allow to disable it. Imagine that
you are making a custom application and want to utilize channels in a different way.

2) Since syncpoint protection is a T186 feature, what about previous
generations? Should we validate syncpoints in software for them? We have
'syncpoint validation' patch staged in grate's kernel
https://github.com/grate-driver/linux/commit/c8b6c82173f2ee9fead23380e8330b8099e7d5e7
(I'll start sending out this and other patches after a bit more thorough
testing.) Improperly used syncpoints potentially could allow one program to
damage others.

3) What exactly does gather filter? Could you list all the commands that it
filters out, please?

4) What about T30/T114 that do not have gather filter? Should we validate those
commands for them in a software firewall?

So maybe we should implement several layers of validation in the SW firewall.
Like all layers for T20 (memory boundaries validation etc), software gather
filter for T30/114 and software syncpoint validation for T30/114/124/210.

-- 
Dmitry
