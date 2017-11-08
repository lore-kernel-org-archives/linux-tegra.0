From: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: next/master boot: 273 boots: 63 failed, 209 passed with 1
 untried/unknown (next-20171106)
Date: Wed, 8 Nov 2017 15:19:43 +0000
Message-ID: <613bcd63-a215-acbe-9150-c1495f7604f6@collabora.com>
References: <5a0055f1.85a8500a.98d54.a4e4@mx.google.com>
 <20171106191713.d7jqg2b6zqchythw@sirena.co.uk>
 <d8e21d87-776b-beff-62af-34e5ad1febc3@nvidia.com>
 <20171107105501.7x74gdqzhr7uulp2@sirena.org.uk>
 <a384e96c-27c7-782b-75b9-7525714f5831@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a384e96c-27c7-782b-75b9-7525714f5831-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "kernelci.org bot" <bot-ssFOTAMYnuFg9hUCZPvPmw@public.gmane.org>, kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/11/17 11:43, Guillaume Tucker wrote:
> On 07/11/17 10:55, Mark Brown wrote:
>> On Tue, Nov 07, 2017 at 10:12:59AM +0000, Jon Hunter wrote:
>>> On 06/11/17 19:17, Mark Brown wrote:
>>
>>>>>     multi_v7_defconfig:
>>>>>         tegra124-nyan-big:
>>>>>             lab-collabora: failing since 2 days (last pass: next-20171102 - first fail: next-20171103)
>>
>>> Thanks for the report. I have been looking into a failure on nyan-big
>>> [0], but this one looks like a new failure. I will take a look.
>>
>> Guillaume Tucker has been bisecting this with the shiny new bisection
>> code he's testing, he was saying on IRC he thinks he's found the
>> offending commit:
>>
>>    https://people.collabora.com/~gtucker/tmp/bisect-tegra-4.14.rc8-next-20171106.txt
>>
>> (not CCing Johannes yet)
>
> Please take this with a pinch of salt, I'm now running some extra
> boot tests to prove it.  If you look at this log, all the boots
> passed which is a bit suspicious.  I did build and boot the
> revision it found with multi_v7_defconfig on tegra124 and it
> passed, so it looks like this commit may not have anything to do
> with the boot failure.  The automated bisection is still experimental.
>
> Passing LAVA boot test with this revision:
>
>   https://lava.collabora.co.uk/scheduler/job/976375
>
> I've started a slightly different bisection job now on
> next-20171107 and the common ancestor between next and mainline,
> results can take a few hours to come back.

After a few more automated bisection attempts and a bug fix in
LAVA, I've now found at least one potentially breaking commit:

   commit d89e2378a97fafdc74cbf997e7c88af75b81610a
   Author: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
   Date:   Thu Oct 12 16:56:14 2017 +0100

       drivers: flag buses which demand DMA configuration


I've run some boot tests manually with this revision and then
also after reverting it in-place, these respectively failed and
passed:

   * d89e2378, failed:
     https://lava.collabora.co.uk/scheduler/job/978968

   * d89e2378 reverted, passed:
     https://lava.collabora.co.uk/scheduler/job/978969


I then went on and tried the same but on top of next-20171108 and
found that they both failed

   * next-20171108, failed:
     https://lava.collabora.co.uk/scheduler/job/979063

   * next-20171108 with d89e2378 reverted, failed as well:
     https://lava.collabora.co.uk/scheduler/job/979167


So this shows there is almost certainly another offending commit
in -next.  The errors in both cases are not quite the same, the
last one is triggered by a BUG whereas the first one is a NULL
pointer (I haven't looked any further).  Also I don't think
there's any fix for d89e2378a97fafdc74cbf997e7c88af75b81610a
which is currently still in next.

Note: This happens to be a very good example of running a
kernelci.org bisection on a real issue, it's quite a bit of a
pipe cleaner.  I'll now see if there's a way to bisect what looks
like another breaking change in-between.

Guillaume
