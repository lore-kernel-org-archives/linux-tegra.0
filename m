From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
Date: Wed, 8 Apr 2020 17:21:39 +0300
Message-ID: <b2405c2a-73c0-ad69-ccea-0388caf8045c@gmail.com>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <08cd31d5-e8b9-4d3a-fb0e-0e4462947d96@nvidia.com>
 <12a834ac-52b1-6dc0-7d3a-3e6a1fa85a2a@gmail.com>
 <e3712e7b-b335-b35b-a94f-24eb85122dca@nvidia.com>
 <b1726d33-0d35-9323-a747-407148d0104e@gmail.com>
 <eb80178f-30f4-8f46-51cd-ea3f4914b81d@nvidia.com>
 <dd16c560-ba8f-e7df-5dc4-5227e0043196@nvidia.com>
 <fea4f0a1-4a20-34d4-9eda-e4a599eeeffc@nvidia.com>
 <760d071e-0cbc-b3eb-9231-fb9f9ecb44a6@nvidia.com>
 <9e317f65-8a02-3b15-cfec-8e0d8374130e@gmail.com>
 <97b35910-4c93-123a-43a0-eb14476ed0f3@nvidia.com>
 <84ad4e2d-6ac1-e1f4-1c55-5edaae850631@nvidia.com>
 <15a879b3-8fb9-6821-3cdc-104ba583ac12@gmail.com>
 <0c425505-347f-7418-af7e-d121fe0d06dc@nvidia.com>
 <db7c7051-5674-cdb9-0aa4-ee94125b3024@gmail.com>
 <1a31cd60-739f-0660-1c45-31487d2f2128@nvidia.com>
 <603084a5-249a-4fe2-3646-e9335ef9ab43@nvidia.com>
 <7895b9c6-f27d-8939-73d7-67d785e1a8b7@nvidia.com>
 <ea60b489-990e-4b15-e215-d93381a1371e@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ea60b489-990e-4b15-e215-d93381a1371e@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc: sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

08.04.2020 03:00, Sowjanya Komatineni пишет:
...
>>>>> I suppose that taking a shot takes at least few milliseconds, which
>>>>> should be unacceptable to waste.
>>>> As long as buffers are in queue we have to keep processing each
>>>> buffer and between buffers obviously we have to wait for previous
>>>> frames to finish and this why we have separate thread for frame
>>>> finish where we can have next buffer capture ready and issue while
>>>> previous frame memory write happens
>> Also we specified numbers buffers as 3 to vb2 queue. So this is rare
>> case but to prevent issuing more than 2 at a time as VI HW is only
>> double buffered and syncpt fifo max depth is 2 added this to be safer.
> 
> To be more clear, when more buffers are enqueued from userspace always
> capture list will be full and thread will be busy in capture till either
> error or stop stream request happens.
> 

If kthreads take more than 1% of CPU time during capture (video) with
more than 2 buffers in queue, then it's not good and I think you should
do something about it. If kthreads stay at ~0%, then it should be okay
as-is.
