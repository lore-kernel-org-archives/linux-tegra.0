From: Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v2] driver core: Remove device link creation limitation
Date: Mon, 29 Jul 2019 14:43:01 -0700
Message-ID: <CAGETcx9oqAJ-VoJnD0Y8k+W8cCGPDz--=amktSgW_sB4MEngDA@mail.gmail.com>
References: <2305283.AStDPdUUnE@kreacher> <c8960d91-4446-9acf-5575-e442a652bd05@gmail.com>
 <CAGETcx_+i6_0Q2rf-UdzZ3bCPUos9Tu4JmvvO0zUoy5gB8_ESQ@mail.gmail.com> <CAJZ5v0h5U60yCyaHeHVbWmwWDa4NBnuhgsV022nZm5HuGgV7ow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJZ5v0h5U60yCyaHeHVbWmwWDa4NBnuhgsV022nZm5HuGgV7ow@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Dmitry Osipenko <digetx@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, Lukas Wunner <lukas@wunner.de>, Jon Hunter <jonathanh@nvidia.com>, Ulf Hansson <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jul 29, 2019 at 2:25 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Mon, Jul 29, 2019 at 10:47 PM Saravana Kannan <saravanak@google.com> wrote:
> >
> > Rafael,
> >
> > This is the fix you need. Or something link this.
> >
> > I had asked you to reject DL_FLAG_MANAGED as an input flag if you are
> > marking it as internal (in the comments). But looks like you were also
> > trying to check for "undefined" bit positions. However, the check
> > isn't correct because DL_MANAGED_FLAGS doesn't include (rightfully so)
> > DL_FLAG_PM_RUNTIME and DL_FLAG_RPM_ACTIVE .
> >
> > I tried to write a DL_FLAG_EXTERNAL to include all the external flags,
> > but that felt like a maintenance headache that's not worth carrying. I
> > think it's simpler to just error out when internal flags being passed
> > in and ignore any undefined bit positions.
>
> Well, IMO it is better to prevent people from passing unrecognized
> flags to device_link_add() at all, even if that means some extra
> effort when adding new flags.

It isn't so much the extra effort that's a concern, but people might
miss updating whatever grouping macro we use.

>
> I'll post an alternative fix shortly.

You might want to move the MANAGED_FLAGs and other grouping macros
into the header file then? So that if someone is adding new flags,
it'll be less likely they'll forget to update the grouping macro?

-Saravana
