From: Ohad Ben-Cohen <ohad@wizery.com>
Subject: Re: permission to move definition of struct rpmsg_channel_info
Date: Sun, 8 Sep 2013 14:27:11 +0200
Message-ID: <CAK=WgbZ2JgtAonvdyeDZazYBGdKpPAieJtjzi7MM6nwqhVfs7g@mail.gmail.com>
References: <5220F099.1020002@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5220F099.1020002@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arjun Gopalan <agopalan@nvidia.com>
Cc: Brian Swetland <swetland@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Paul Walmsley <pwalmsley@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi Arjun,

On Fri, Aug 30, 2013 at 9:20 PM, Arjun Gopalan <agopalan@nvidia.com> wrote:
>
> Hi Ohad/Brian,
>
> I have been working on rpmsg and I need to be able to create static rpmsg channels. Channel information needs to be specified by other drivers and for this, the drivers need access to struct rpmsg_channel_info.

I'm not convinced how useful it is for other Linux drivers to create
static rpmsg channels?

Usually these channels reflect the existence of services running on
the remote processor, and their creation (or lack thereof) should be
specified in the remote image. This way an rpmsg channel is published
iff there is a matching remote service.

The way we were planning to add static channels functionality (I
should still have preliminary patches doing this somewhere but the
entire work was put on hold since TI changed its focus) is by
statically publishing them in the resource table, which is coupled
with a specific remote image.

Best,
Ohad.
