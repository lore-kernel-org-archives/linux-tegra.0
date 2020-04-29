From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
Date: Wed, 29 Apr 2020 17:46:46 +0300
Message-ID: <5863e364-480e-7839-c42b-73a7f6990a30@gmail.com>
References: <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <c1190858-eaea-8e94-b4d1-1cf28076c330@gmail.com>
 <20200427110033.GC3464906@ulmo>
 <3a06811c-02dc-ce72-ebef-78c3fc3f4f7c@gmail.com>
 <20200427151234.GE3464906@ulmo>
 <1ab276cf-c2b0-e085-49d8-b8ce3dba8fbe@gmail.com>
 <20200429081448.GA2345465@ulmo> <20200429085502.GB2345465@ulmo>
 <9e36c4ec-ca02-bd15-d765-15635f09db4b@gmail.com>
 <7442f4cd-6406-41f6-5c9b-932bff8ad5b2@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7442f4cd-6406-41f6-5c9b-932bff8ad5b2-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

29.04.2020 16:57, Jon Hunter пишет:
> 
> On 29/04/2020 13:35, Dmitry Osipenko wrote:
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
> 
> From reading the changelog for commit 1e2ef05bb8cf ("PM: Limit race
> conditions between runtime PM and system sleep (v2))", this is the
> expected behaviour for runtime resume in the noirq phase.

I'm curious whether there is a way to tell RPM that it's okay to do it
for a particular device, like I2C that uses IRQ-safe RPM + doesn't have
parent devices that need to be resumed.
