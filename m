From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 1/3] drm/tegra: dc: Enable plane scaling filters
Date: Fri, 4 May 2018 14:55:01 +0300
Message-ID: <85841227-e008-b129-f1e0-689837877e61@gmail.com>
References: <20180504000844.18661-1-digetx@gmail.com>
 <20180504000844.18661-2-digetx@gmail.com> <20180504111004.GP13459@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180504111004.GP13459@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 04.05.2018 14:10, Thierry Reding wrote:
> On Fri, May 04, 2018 at 03:08:42AM +0300, Dmitry Osipenko wrote:
>> Currently resized plane produces a "pixelated" image which doesn't look
>> nice, especially in a case of a video overlay. Enable scaling filters that
>> significantly improve image quality of a scaled overlay.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/gpu/drm/tegra/dc.c | 51 ++++++++++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/tegra/dc.h |  7 ++++++
>>  2 files changed, 58 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
>> index 9f83a65b5ea9..2e81142281c3 100644
>> --- a/drivers/gpu/drm/tegra/dc.c
>> +++ b/drivers/gpu/drm/tegra/dc.c
>> @@ -361,6 +361,47 @@ static void tegra_dc_setup_window(struct tegra_plane *plane,
>>  	if (window->bottom_up)
>>  		value |= V_DIRECTION;
>>  
>> +	if (!(dc->soc->has_win_a_without_filter && plane->index == 0) &&
>> +	    !(window->src.w == window->dst.w)) {
> 
> I don't know about you, but I get dizzy trying to parse the above. How
> about we move this into helpers:

+1

> 	static bool tegra_plane_has_horizontal_filter(struct tegra_plane *plane)
> 	{
> 		struct tegra_dc *dc = plane->dc;
> 
> 		/* this function should never be called on inactive planes */
> 		if (WARN_ON(!dc))
> 			return false;
> 
> 		if (plane->index == 0 && dc->soc->has_win_a_without_filter)
> 			return false;
> 
> 		return true;
> 	}
> 
> Then the above becomes:
> 
> 	bool scale_x = window->dst.w != window->src.w;
> 
> 	if (scale_x && tegra_plane_has_horizontal_filter(plane)) {
> 
>> +		/*
>> +		 * Enable horizontal 6-tap filter and set filtering
>> +		 * coefficients to the default values defined in TRM.
>> +		 */
>> +		tegra_plane_writel(plane, 0x00008000, DC_WIN_H_FILTER_P(0));
>> +		tegra_plane_writel(plane, 0x3e087ce1, DC_WIN_H_FILTER_P(1));
>> +		tegra_plane_writel(plane, 0x3b117ac1, DC_WIN_H_FILTER_P(2));
>> +		tegra_plane_writel(plane, 0x591b73aa, DC_WIN_H_FILTER_P(3));
>> +		tegra_plane_writel(plane, 0x57256d9a, DC_WIN_H_FILTER_P(4));
>> +		tegra_plane_writel(plane, 0x552f668b, DC_WIN_H_FILTER_P(5));
>> +		tegra_plane_writel(plane, 0x73385e8b, DC_WIN_H_FILTER_P(6));
>> +		tegra_plane_writel(plane, 0x72435583, DC_WIN_H_FILTER_P(7));
>> +		tegra_plane_writel(plane, 0x714c4c8b, DC_WIN_H_FILTER_P(8));
>> +		tegra_plane_writel(plane, 0x70554393, DC_WIN_H_FILTER_P(9));
>> +		tegra_plane_writel(plane, 0x715e389b, DC_WIN_H_FILTER_P(10));
>> +		tegra_plane_writel(plane, 0x71662faa, DC_WIN_H_FILTER_P(11));
>> +		tegra_plane_writel(plane, 0x536d25ba, DC_WIN_H_FILTER_P(12));
>> +		tegra_plane_writel(plane, 0x55731bca, DC_WIN_H_FILTER_P(13));
>> +		tegra_plane_writel(plane, 0x387a11d9, DC_WIN_H_FILTER_P(14));
>> +		tegra_plane_writel(plane, 0x3c7c08f1, DC_WIN_H_FILTER_P(15));
>> +
>> +		value |= H_FILTER;
>> +	}
>> +
>> +	if (!(dc->soc->has_win_a_without_filter && plane->index == 0) &&
>> +	    !(dc->soc->has_win_c_without_vert_filter && plane->index == 2) &&
>> +	    !(window->src.h == window->dst.h)) {
> 
> 	static bool tegra_plane_has_vertical_filter(struct tegra_plane *plane)
> 	{
> 		struct tegra_dc *dc = plane->dc;
> 
> 		/* this function should never be called on inactive planes */
> 		if (WARN_ON(!dc))
> 			return false;
> 
> 		if (plane->index == 0 && dc->soc->has_win_a_without_filter)
> 			return false;
> 
> 		if (plane->index == 2 && dc->soc->has_win_c_without_vert_filter)
> 			return false;
> 
> 		return true;
> 	}
> 
> And the above becomes:
> 
> 	bool scale_y = window->dst.h != window->src.h;
> 
> 	if (scale_y && tegra_plane_has_vertical_filter(plane)) {

I'll adjust this patch, thanks.

Maybe it also worth to factor filtering out into a custom DRM property? For
example in a case of libvdpau-tegra we perform the exact same filtering on
blitting YUV to RGB surface (shown as overlay) by GR2D for displaying video
players interface on top of video, this results in a double filtering that has
no visual effect and probably wastes memory bandwidth a tad.

Though I'm not very keen anymore on trying to add custom plane properties after
being previously NAK'ed. We can wrap filtering into a property later if will be
desired, should be good to just have it enabled by default for now.
