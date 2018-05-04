From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 2/3] drm/tegra: plane: Implement zPos plane property
 for older Tegra's
Date: Fri, 4 May 2018 15:32:06 +0300
Message-ID: <1a0c4c45-d4b1-3f3c-f804-deaa8458b652@gmail.com>
References: <20180504000844.18661-1-digetx@gmail.com>
 <20180504000844.18661-3-digetx@gmail.com> <20180504121530.GS13459@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180504121530.GS13459@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 04.05.2018 15:15, Thierry Reding wrote:
> On Fri, May 04, 2018 at 03:08:43AM +0300, Dmitry Osipenko wrote:
>> Older Tegra's do not support planes z position handling in hardware,
>> but HW provides knobs for zPos implementation in software.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/gpu/drm/tegra/dc.c    | 134 ++++++++++++++++-------
>>  drivers/gpu/drm/tegra/plane.c | 193 ++++++++++++++++++++++++----------
>>  drivers/gpu/drm/tegra/plane.h |  13 ++-
>>  3 files changed, 244 insertions(+), 96 deletions(-)
> 
> This is obviously a lot to review, but it looks pretty good. On minor
> comment below.
> 
>> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
>> index 2e81142281c3..ba5481cd470d 100644
>> --- a/drivers/gpu/drm/tegra/dc.c
>> +++ b/drivers/gpu/drm/tegra/dc.c
>> @@ -162,29 +162,90 @@ static void tegra_plane_setup_blending_legacy(struct tegra_plane *plane)
> [...]
>> +		case 1:
>> +			/*
>> +			 * When both middle and topmost windows have an alpha,
>> +			 * these windows a mixed together and then the result
>> +			 * is blended over the bottom window.
>> +			 */
>> +			if ((state->blending[0].alpha &&
>> +			     state->blending[0].top))
> 
> There seems to be one pair of parentheses too much here.

Good catch ;)
