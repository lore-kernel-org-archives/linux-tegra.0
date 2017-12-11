From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 1/2] drm/tegra: dc: Link DC1 to DC0 on Tegra20
Date: Mon, 11 Dec 2017 17:59:29 +0300
Message-ID: <ebdfcd95-2141-2912-d653-59eb3c68c982@gmail.com>
References: <85902b42264b094cbf7cf30930f8c0bbccdca1b7.1512947732.git.digetx@gmail.com>
 <20171211101222.GF10671@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171211101222.GF10671@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11.12.2017 13:12, Thierry Reding wrote:
> On Mon, Dec 11, 2017 at 02:19:43AM +0300, Dmitry Osipenko wrote:
>> HW reset isn't actually broken on Tegra20, but there is a dependency on
>> first display controller to be taken out of reset for the second to be
>> enabled successfully.
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/gpu/drm/tegra/dc.c | 77 +++++++++++++++++++++++++++++-----------------
>>  drivers/gpu/drm/tegra/dc.h |  4 ++-
>>  2 files changed, 51 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
>> index fc70351b9017..6139d3e9cedf 100644
>> --- a/drivers/gpu/drm/tegra/dc.c
>> +++ b/drivers/gpu/drm/tegra/dc.c
>> @@ -24,6 +24,8 @@
>>  #include <drm/drm_atomic_helper.h>
>>  #include <drm/drm_plane_helper.h>
>>  
>> +static struct tegra_dc *dc0;
> 
> I'd like to avoid the global variable. Perhaps you can use the
> driver_for_each_device() or driver_find_device() functions to find the
> correct device?

driver_find_device() fit perfectly, thank you for the suggestion.
