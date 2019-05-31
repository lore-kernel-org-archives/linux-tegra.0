From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V2] drivers: i2c: tegra: fix checkpatch defects
Date: Fri, 31 May 2019 15:45:06 +0300
Message-ID: <2d83ad21-b012-1b3e-fc9a-741972ee3ba9@gmail.com>
References: <1559196850-7007-1-git-send-email-bbiswas@nvidia.com>
 <e9e3d8b0-a76a-81a9-1110-2d07ba1c787f@gmail.com>
 <911e52ed-8f3c-583a-7610-e38723219eca@gmail.com>
 <b86b9104-1754-531f-70b9-3c1a5d347b9b@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b86b9104-1754-531f-70b9-3c1a5d347b9b@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bitan Biswas <bbiswas@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

31.05.2019 12:04, Bitan Biswas пишет:
> 
> 
> On 5/30/19 4:43 AM, Dmitry Osipenko wrote:
>> 30.05.2019 14:36, Dmitry Osipenko пишет:
>>> 30.05.2019 9:14, Bitan Biswas пишет:
>>>> Fix checkpatch.pl warning(s)/error(s)/check(s) in i2c-tegra.c
>>>> except for BUG/BUG_ON checks
>>>
>>> Please turn the BUG_ON's into WARN_ON's. The machine won't go on fire,
>>> hence there is absolutely no good reason in making system unusable on a
>>> software bug. BUG_ON may be more useful for development, but not for a
>>> casual daily usage.
> I shall update the patch to remove the BUG/BUG_ON calls.

Please replace them with WARN_ON_ONCE.
