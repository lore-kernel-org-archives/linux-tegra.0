From: Dariusz Marcinkiewicz <darekm@google.com>
Subject: Re: [PATCH v7 0/9] drm: cec: convert DRM drivers to the new notifier API
Date: Mon, 19 Aug 2019 13:28:29 +0200
Message-ID: <CALFZZQHu1C_8idxkwjBdxpW=y9gKmDnLOeTHZ9iAkNo7YubZHg@mail.gmail.com>
References: <20190814104520.6001-1-darekm@google.com> <42c7ef3c-b7e5-8c63-c7c2-bfc6c56100c6@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <42c7ef3c-b7e5-8c63-c7c2-bfc6c56100c6@xs4all.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, Kate Stewart <kstewart@linuxfoundation.org>, Neil Armstrong <narmstrong@baylibre.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Hans Verkuil <hverkuil@xs4all.nl>, Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>, Sam Ravnborg <sam@ravnborg.org>, linux-samsung-soc@vger.kernel.org, David Francis <David.Francis@amd.com>, amd-gfx@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>, "Jerry (Fangzhi) Zuo" <Jerry.Zuo@amd.com>, linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>, Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org, Russell King <rmk+kernel@armlinux.org.uk>, Sean Paul <seanpaul@chromium.org>, Rodrigo Vivi <rodrigo.v>
List-Id: linux-tegra@vger.kernel.org

On Mon, Aug 19, 2019 at 11:38 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> Hi all,
>
Hi Hans.
> The patches in this series can be applied independently from each other.
>
> If you maintain one of these drivers and you want to merge it for v5.4
> yourself, then please do so and let me know. If you prefer I commit it
> to drm-misc, then please review and (hopefully) Ack the patch.
>
> I would really like to get this in for v5.4 so I can get the userspace
> bits in for v5.4 as well through the media subsystem.
>
> Dariusz, can you post a v7.1 for patch 5/9 fixing the typo?
>
Done.

I think it would be good to test v7 changes to dw-hdmi and tda998x on
a real hardware. Hans, do you think you would be able to test those?

Thank you.
