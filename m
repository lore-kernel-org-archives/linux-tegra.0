From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
Date: Fri, 10 Apr 2020 22:45:27 +0300
Message-ID: <34d9baa0-fa1e-0b67-fb9b-343b3cba0066@gmail.com>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <97b35910-4c93-123a-43a0-eb14476ed0f3@nvidia.com>
 <84ad4e2d-6ac1-e1f4-1c55-5edaae850631@nvidia.com>
 <15a879b3-8fb9-6821-3cdc-104ba583ac12@gmail.com>
 <0c425505-347f-7418-af7e-d121fe0d06dc@nvidia.com>
 <db7c7051-5674-cdb9-0aa4-ee94125b3024@gmail.com>
 <1a31cd60-739f-0660-1c45-31487d2f2128@nvidia.com>
 <603084a5-249a-4fe2-3646-e9335ef9ab43@nvidia.com>
 <7895b9c6-f27d-8939-73d7-67d785e1a8b7@nvidia.com>
 <ea60b489-990e-4b15-e215-d93381a1371e@nvidia.com>
 <b2405c2a-73c0-ad69-ccea-0388caf8045c@gmail.com>
 <15d8b525-67b5-b437-f7fd-89f80cd0d9f6@nvidia.com>
 <a638bb8e-bb50-7aa5-05a0-8de1c6207ba7@nvidia.com>
 <ced73258-6f4b-e970-4ca5-ecdf1808a4c3@nvidia.com>
 <ad646fde-2eed-eeeb-4d85-ec36d6613eb1@nvidia.com>
 <7288cacd-badc-cb01-1f4c-286dd024ca10@gmail.com>
 <77c88717-618f-b366-2b6a-f8b4abaa66cc@nvidia.com>
 <00708f34-cf45-e248-c6b0-c3d2286671ca@gmail.com>
 <ab010164-e8ea-89e9-a7e9-d7213841fa90@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <ab010164-e8ea-89e9-a7e9-d7213841fa90@nvidia.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc: sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

10.04.2020 21:59, Sowjanya Komatineni пишет:
...
>> It's still not clear to me how the "pre-queued buffers" will be limited.
>> I'll take another look at the v7.
> 
> OK, but I don't understand what you mean by limit on pre-queued buffers.
> 
> I was saying vb2 queue has min_buffers_needed which was set to 3 where
> streaming will start only after 3 buffers got queued up.
> 
> Regarding outstanding condition check to make sure no more than 2 syncpt
> trigger requests are in FIFO I added it to be safe where mostly we may
> not hit and also I only see capture start thread holding for it during
> initial frame capture as it issues single shot for 1st 2 buffers capture
> and holds 3 buffers which is already queued till at least one of those 2
> issued capture is done to make sure of not triggering syncpt condition
> when fifo already has 2 pending.
> 
> In v7, will remove setting min_buffers_needed and also outstanding
> syncpt trigger check.

Okay, seems I got what you're saying. Yes, the check should be removed.
It's impossible to get the frame-start event while capture of the
previous buffer is in-progress.
