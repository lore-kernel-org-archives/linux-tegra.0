From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
Date: Wed, 29 Apr 2020 19:54:49 +0300
Message-ID: <bd622667-9364-abfa-ad98-5ed51919ca09@gmail.com>
References: <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <c1190858-eaea-8e94-b4d1-1cf28076c330@gmail.com>
 <20200427110033.GC3464906@ulmo>
 <3a06811c-02dc-ce72-ebef-78c3fc3f4f7c@gmail.com>
 <20200427151234.GE3464906@ulmo>
 <1ab276cf-c2b0-e085-49d8-b8ce3dba8fbe@gmail.com>
 <20200429081448.GA2345465@ulmo> <20200429085502.GB2345465@ulmo>
 <9e36c4ec-ca02-bd15-d765-15635f09db4b@gmail.com>
 <20200429163020.GB3157354@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200429163020.GB3157354@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

29.04.2020 19:30, Thierry Reding пишет:
> On Wed, Apr 29, 2020 at 03:35:26PM +0300, Dmitry Osipenko wrote:
>> 29.04.2020 11:55, Thierry Reding пишет:
>> ...
>>>>> It's not "papering over an issue". The bug can't be fixed properly
>>>>> without introducing I2C atomic transfers support for a late suspend
>>>>> phase, I don't see any other solutions for now. Stable kernels do not
>>>>> support atomic transfers at all, that proper solution won't be backportable.
>>>>
>>>> Hm... on a hunch I tried something and, lo and behold, it worked. I can
>>>> get Cardhu to properly suspend/resume on top of v5.7-rc3 with the
>>>> following sequence:
>>>>
>>>> 	revert 9f42de8d4ec2 i2c: tegra: Fix suspending in active runtime PM state
>>>> 	apply http://patchwork.ozlabs.org/project/linux-tegra/patch/20191213134417.222720-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org/
>>>>
>>>> I also ran that through our test farm and I don't see any other issues.
>>>> At the time I was already skeptical about pm_runtime_force_suspend() and
>>>> pm_runtime_force_resume() and while I'm not fully certain why exactly it
>>>> doesn't work, the above on top of v5.7-rc3 seems like a good option.
>>>>
>>>> I'll try to do some digging if I can find out why exactly force suspend
>>>> and resume doesn't work.
>>>
>>> Ah... so it looks like pm_runtime_force_resume() never actually does
>>> anything in this case and then disable_depth remains at 1 and the first
>>> tegra_i2c_xfer() will then fail to runtime resume the controller.
>>
>> That's the exactly expected behaviour of the RPM force suspend/resume.
>> The only unexpected part for me is that the tegra_i2c_xfer() runtime
>> resume then fails in the NOIRQ phase.
>>
>> Anyways, again, today it's wrong to use I2C in the NOIRQ phase becasue
>> I2C interrupt is disabled. It's the PCIe driver that should be fixed.
> 
> I don't think so. Everything works perfectly fine if we fix system
> suspend/resume not to rely on pm_runtime_force_{suspend,resume}() and
> directly call the runtime suspend/resume implementations.

It should "work" only in conjunction with my I2C patch, otherwise you'll
get a spurious I2C timeout error. And it will "work" only because
interrupt is handled manually after the timeout, meaning that yours
suspending time will take few hundreds ms more.

> So can we please stop deflecting and fix the damn I2C driver. From my
> perspective we have two choices:
> 
>   1) do what I suggested above and revert the force suspend/resume patch
>      and apply the "manual" suspend/resume patch instead
> 
>   2) revert this patch and go back to the drawing board
> 
> I suspect that with 2) we'd end up back where we started and have to do
> 1) anyway.
> 
> An alternative that I'd prefer even more would be to do 2) now for v5.7
> and then we do 1) for v5.8 and give this some more soaking time.

I2C driver isn't broken, PCIe driver is. IMO.

Both yours variants are not going to be a backportable fix for the
stable kernels, they won't fix the suspended interrupt problem. What I'm
missing?
