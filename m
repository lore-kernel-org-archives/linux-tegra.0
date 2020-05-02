From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
Date: Sat, 2 May 2020 23:48:42 +0300
Message-ID: <4abf30e0-fed9-ba39-ae38-350789bce99d@gmail.com>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <668d9b65-9590-cc97-41c3-2c1a5cfbbe61@nvidia.com>
 <289d9c92-383f-3257-de7b-46179724285a@nvidia.com>
 <9aa64f21-7b23-7228-b5eb-d2ff092682ad@nvidia.com>
 <668cc4a0-2c81-0d87-b801-9fbf64e19137@nvidia.com>
 <bf3f654e-b8f8-d560-fc5e-03d73cb7eab0@nvidia.com>
 <525e481b-9137-6fdd-bbf9-3779a5704e6b@nvidia.com>
 <fe7ebad6-0368-b1f0-4f58-648baa5e3f79@nvidia.com>
 <4f095181-2338-3b71-316c-f8bbfc7865cc@nvidia.com>
 <50e872bb-913a-7b47-3264-af6b1cedb0e2@nvidia.com>
 <e17a8a49-be53-465d-f64c-3f4c77391d98@nvidia.com>
 <da5154b4-85f9-3e56-a440-f75debaec3a8@nvidia.com>
 <cbb047ae-97dc-8b9a-a5ba-8e2a5dab3771@nvidia.com>
 <6ae2d00d-7955-d12b-5b56-955ef72ece26@nvidia.com>
 <f9073b28-f1f1-636c-be53-764fb0a531a1@gmail.com>
 <1767e50f-efb7-5e89-22f6-0917821b660d@nvidia.com>
 <235a4cd4-4d4a-04b8-6c65-43a4dba48a0b@nvidia.com>
 <f8103170-7879-8597-3e3c-da9a3b6a40b3@nvidia.com>
 <5d847770-dad9-8f18-67b5-c1ba79084957@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <5d847770-dad9-8f18-67b5-c1ba79084957@nvidia.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc: sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

02.05.2020 19:55, Sowjanya Komatineni пишет:
> Also stop stream ioctl request happens during suspend where both threads
> will be stopped properly. done thread stop happens only after finishing
> all outstanding buffers.

Do you mean that V4L core takes care of stopping the streami on suspend
and re-starting it on resume from suspend?

> Stop stream request happens from streaming applications so even without
> driver suspend/resume implementation currently, streaming will be
> stopped prior to system  suspend where both threads will be stopped
> properly (after finishing out standing buffers) and will be resumed by
> application on system resume

All userspace is frozen on suspend. System suspension is transparent for
userspace applications. I'm not sure what you're meaning here.

> Also tested suspending while streaming with this unconditional freeze, I
> don't see any issue as application stops stream where v4l_streamoff gets
> executed during suspend and on resume streaming starts where
> v4l_streamon happens.
> 
> So, I don't see any issue with existing implementation of unconditional
> freeze.

I don't understand why freezing is needed at all if V4L core takes care
of stopping the stream on suspend, what is the point? If there is no
real point, then let's make threads non-freezable and done with that.
