From: Jon Mayo <jon-MQ+mZzckBGs@public.gmane.org>
Subject: Re: [PATCH v2 2/2] drm: tegra: check HDMI sink capability
Date: Wed, 16 Jan 2013 08:05:23 -0800
Message-ID: <CADWT_cPv4oXr6Yuc8SfJBY0vTC-Gh4914jzXGnuMcP0Qff0f5Q@mail.gmail.com>
References: <1358347002-10999-1-git-send-email-dev@lynxeye.de>
	<1358347002-10999-2-git-send-email-dev@lynxeye.de>
	<20130116152421.GB965@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130116152421.GB965-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 16, 2013 at 7:24 AM, Thierry Reding
<thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> On Wed, Jan 16, 2013 at 03:36:42PM +0100, Lucas Stach wrote:
>> Check if sink is HDMI capable when enabling an output. This disables
>> HDMI audio/infoframes if we are talking to a plain DVI sink. All things
>> except this check are already in place.
>>
>> Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
>> ---
>>  drivers/gpu/drm/tegra/hdmi.c | 3 +++
>>  1 file changed, 3 insertions(+)
>
> Reviewed-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>

Reviewed-by: Jon Mayo <jmayo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
