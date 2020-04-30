From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v1 3/5] media: tegra-video: Move PM runtime handle to
 streaming
Date: Thu, 30 Apr 2020 16:24:19 +0300
Message-ID: <6a676161-e948-9afc-296b-ccd1df202e36@gmail.com>
References: <1588047650-29402-1-git-send-email-skomatineni@nvidia.com>
 <1588047650-29402-4-git-send-email-skomatineni@nvidia.com>
 <631390cb-9aff-0e3f-6c39-81d6c565987e@gmail.com>
 <3ef69413-a606-b475-f530-d5534760b73b@nvidia.com>
 <2b334095-fadb-bf0a-f7a8-62fc798c2bd2@gmail.com>
 <18a7b095-7f0f-7819-c786-7e011cfd14ed@nvidia.com>
 <ce31e273-f424-f13e-5cd6-0db2589a2a10@gmail.com>
 <5741d5d3-e474-e23c-4841-809df5760067@nvidia.com>
 <f6e34203-3e4b-b804-30a5-bf78445ab366@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f6e34203-3e4b-b804-30a5-bf78445ab366-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

28.04.2020 19:04, Dmitry Osipenko пишет:
...
>>>>>>>> +             ret = pm_runtime_get_sync(csi->dev);
>>>>>>>> +             if (ret < 0) {
>>>>>>>> +                     dev_err(csi->dev,
>>>>>>>> +                             "failed to get runtime PM: %d\n",
>>>>>>>> ret);
>>>>>>>> +                     pm_runtime_put_noidle(csi->dev);
>>> Why this pm_runtime_put_noidle() is needed? This should be wrong, please
>>> remove it.
>>
>> pm_runtime_get_sync() increments power.usage_count prior to rpm_resume
>>
>> if rpm_resume fails it does not decrement usage_count.
>>
>> So to balance count on failure, calling pm_runtime_put_noidle()
> 
> Hmm.. maybe you're right. I'll need to take a more detailed look.
> 

I checked the RPM's use-count after error condition and yours variant is
correct. Perhaps we should start correcting all other Tegra drivers that
do not handle the RPM error properly.
