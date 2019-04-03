From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] drm/tegra: plane: Remove format-modifier checking
Date: Wed, 3 Apr 2019 13:48:45 +0300
Message-ID: <cc3e1991-1990-9f8f-b36a-ff345596ec35@gmail.com>
References: <20190224153405.8447-1-digetx@gmail.com>
 <46fb6670-59ed-0378-cd7e-aea3fd4ee890@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <46fb6670-59ed-0378-cd7e-aea3fd4ee890@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

27.02.2019 18:08, Dmitry Osipenko пишет:
> 24.02.2019 18:34, Dmitry Osipenko пишет:
>> Tiling modifier can't be applied to YV12 video overlay because all tiling
>> modifiers are filtered out for multi-plane formats. AFAIK, all modifiers
>> should work with all of formats, hence the checking is incorrect and
>> simply not needed.
>>
>> Fixes: e90124cb46bdb ("drm/tegra: plane: Support format modifiers")
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
> 
> For the reference.. this patch needs a stable tag, I did the same mistake in [0]. Thierry, please let me know if you're okay with the change and if you could add the tag while applying the patch, thanks.
> 
> [0] https://lkml.org/lkml/2019/2/26/277
> 

Thierry, please don't forget about this patch.
