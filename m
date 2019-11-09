From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2] drm/tegra: Turn off and reset hardware across
 suspend-resume
Date: Sat, 9 Nov 2019 20:01:10 +0300
Message-ID: <4280db25-98cb-b47b-06c8-0666f364dea3@gmail.com>
References: <20190811183932.15850-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190811183932.15850-1-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

11.08.2019 21:39, Dmitry Osipenko пишет:
> The drivers core bumps runtime PM refcount during of entering into
> suspend to workaround some problem where parent device may become turned
> off before its children. In order to disable and reset CRTCs/HDMI/etc
> hardware, the runtime PM needs to be "forced" into suspend mode.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Hello Thierry,

Is there any particular reason why you're skipping this patch?
The driver's suspend-resume doesn't work properly without it.
