From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
Date: Sat, 2 May 2020 17:40:35 +0300
Message-ID: <e5a3dd07-97f5-29f1-974e-3037a01cc89c@gmail.com>
References: <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
 <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
 <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <c1190858-eaea-8e94-b4d1-1cf28076c330@gmail.com>
 <20200427103851.GB24446@kunai>
 <dc2de966-81d6-6ad5-0c51-16dd28ca4165@gmail.com>
 <20200427141922.GD3464906@ulmo> <20200427153106.GA8113@kunai>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200427153106.GA8113@kunai>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

27.04.2020 18:31, Wolfram Sang пишет:
> 
>> Yes, that bug should be fixed anyway. But that doesn't justify breaking
>> suspend/resume completely, which *is* a regression.
>>
>> Look, I'm not saying that we should drop this patch altogether. All I'm
>> saying is that we should postpone it so that we can: a) get suspend and
>> resume working again (and by doing so make sure no other suspend/resume
>> regressions silently creep in, because that always seems to happen when
>> you're not looking) and b) fix any preexisting issues without possibly
>> scrambling the result with this perhaps unrelated fix.
>>
>> So, again, I think the safest road forward is to back this one out for
>> now, fix whatever this other bug is and once suspend/resume is working
>> properly again we can revisit this patch based on a known-good baseline.
> 
> I am with you here. I want to add that the proper fix should be
> developed without thinking too much about stable in the first place.
> *When* we have a proper working fix, then we can think about making it
> "more" suitable for backporting. Yet, it may also be a result that older
> kernels need a different solution. Or have no solution at all, in case
> they can't do atomic_transfers and this is needed.
> 
> D'accord?
> 

I saw that you submitted the revert of the patches for 5.7, hopefully it
won't result in putting the PCIe driver problem into the back burner.
I'll try not to forget about these patches to resubmit them later on,
once the problem will be resolved :)
