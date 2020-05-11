From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v5 1/6] of_graph: add of_graph_get_local_port()
Date: Mon, 11 May 2020 15:27:47 -0500
Message-ID: <CAL_Jsq+xU4p+CQ=xzvgcktCo9i=SfHajMgbZ1DKOVzo+hCYdCw@mail.gmail.com>
References: <20200418170703.1583-1-digetx@gmail.com> <20200418170703.1583-2-digetx@gmail.com>
 <20200506163237.GA19296@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200506163237.GA19296@ravnborg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Frank Rowand <frowand.list@gmail.com>, linux-tegra <linux-tegra@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, May 6, 2020 at 11:32 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Dmitry
>
> On Sat, Apr 18, 2020 at 08:06:58PM +0300, Dmitry Osipenko wrote:
> > In some case, like a DRM display code for example, it's useful to silently
> > check whether port node exists at all in a device-tree before proceeding
> > with parsing the graph.
> >
> > This patch adds of_graph_get_local_port() which returns pointer to a local
> > port node, or NULL if graph isn't specified in a device-tree for a given
> > device node.
> >
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Nice little helper function.
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>
> Rob - OK to commit to drm-misc-next?

Yes, that's why I gave my R-by.

Rob
