From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: Re: [PATCH] media: staging: tegra-vde: fix runtime pm imbalance
 on error
Date: Thu, 21 May 2020 17:22:05 +0200
Message-ID: <CAJZ5v0irLayBUPRWNT1tcZivz9inS1YbUgGj5WXvucLKKwRQAw@mail.gmail.com>
References: <20200520095148.10995-1-dinghao.liu@zju.edu.cn>
 <2b5d64f5-825f-c081-5d03-02655c2d9491@gmail.com> <20200520150230.GC30374@kadam>
 <2a46539d.b977f.1723553aa81.Coremail.dinghao.liu@zju.edu.cn> <20200521091505.GF30374@kadam>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200521091505.GF30374@kadam>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: dinghao.liu@zju.edu.cn, devel@driverdev.osuosl.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux PM <linux-pm@vger.kernel.org>, Kangjie Lu <kjlu@umn.edu>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-tegra <linux-tegra@vger.kernel.org>, Dmitry Osipenko <digetx@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, May 21, 2020 at 11:15 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Thu, May 21, 2020 at 11:42:55AM +0800, dinghao.liu@zju.edu.cn wrote:
> > Hi, Dan,
> >
> > I agree the best solution is to fix __pm_runtime_resume(). But there are also
> > many cases that assume pm_runtime_get_sync() will change PM usage
> > counter on error. According to my static analysis results, the number of these
> > "right" cases are larger. Adjusting __pm_runtime_resume() directly will introduce
> > more new bugs. Therefore I think we should resolve the "bug" cases individually.
> >
>
> That's why I was saying that we may need to introduce a new replacement
> function for pm_runtime_get_sync() that works as expected.
>
> There is no reason why we have to live with the old behavior.

What exactly do you mean by "the old behavior"?
