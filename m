From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v4 00/16] NVIDIA Tegra devfreq improvements and
 Tegra20/30 support
Date: Tue, 4 Jun 2019 09:49:58 +0900
Message-ID: <683b343a-e64f-8345-ac44-10f5c00521bd@samsung.com>
References: <CGME20190501234148epcas5p1cc9a8dafa9ee6d8d046d1292b8270727@epcas5p1.samsung.com>
        <20190501233815.32643-1-digetx@gmail.com>
        <60ef6e47-e61b-3a92-e90d-90debedfcfc4@samsung.com>
        <fa061a65-f108-6c5e-1f87-950a9a8caafc@gmail.com>
        <0fb50eb1-a173-1756-6889-2526a10ac707@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0fb50eb1-a173-1756-6889-2526a10ac707@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Kyungmin Park <kyungmin.park@samsung.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 19. 6. 4. 오전 1:52, Dmitry Osipenko wrote:
> 03.05.2019 3:52, Dmitry Osipenko пишет:
>> 03.05.2019 3:31, Chanwoo Choi пишет:
>>> Hi Dmitry,
>>>
>>> On 19. 5. 2. 오전 8:37, Dmitry Osipenko wrote:
>>>> Changelog:
>>>>
>>>> v4: Addressed all review comments that were made by Chanwoo Choi to v3:
>>>>
>>>>     - changed the driver removal order to match the probe exactly
>>>>     - added clarifying comment for 1/8 ratio to the Tegra20 driver
>>>>
>>>>     Chanwoo, please also note that the clk patch that should fix
>>>>     compilation problem that was reported the kbuild-test-robot is already
>>>>     applied and available in the recent linux-next.
>>>
>>> I knew that Stephen picked up your path about clock.
>>
>> Hi Chanwoo,
>>
>> Okay, good. Thank you very much for reviewing this series! I assume it's
>> too late now for v5.2, but it should be good to go for v5.3.
>>
> 
> Hello Chanwoo,
> 
> Will be nice to see the patches in the linux-next before they'll hit mainline. We have tested that
> everything works fine on a selective devices, but won't hurt to get some extra testing beforehand.
> AFAIK, at least NVIDIA people are regularly testing -next on theirs dev boards. Please note that
> this not very important, so don't bother if there is some hurdle with pushing to the tracking branch
> for now. Also please let me know if you're expecting to see some ACK's on the patches, I'm sure
> we'll be able to work out that with Thierry and Jon if necessary.
> 
> 

Hi Dmitry,
I think that it is enough for applying to mainline branch.
The devfreq.git is maintained by Myungjoo. He will be merged or
reviewed if there are th remained review point.


Hi Myungjoo,
I reviewed the Dmitry's patches from v1 to v4 patches.
And then I tested them on my testing branch[1] for catching
the build warning and error. In result, it is clean.
[1] https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git/log/?h=devfreq-testing

Please review or apply these patches for v5.3.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
