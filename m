From: syzbot <syzbot+979ffc89b87309b1b94b@syzkaller.appspotmail.com>
Subject: Re: WARNING: ODEBUG bug in netdev_freemem
Date: Sat, 23 Mar 2019 23:09:01 -0700
Message-ID: <0000000000009c14c60584d0ec76@google.com>
References: <000000000000bc9ddf057e577c98@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <000000000000bc9ddf057e577c98@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: a@unstable.cc, alexander.h.duyck@intel.com, amritha.nambiar@intel.com, b.a.t.m.a.n@lists.open-mesh.org, davem@davemloft.net, decot@googlers.com, digetx@gmail.com, dmitry.torokhov@gmail.com, jeffrey.t.kirsher@intel.com, joe@perches.com, jonathanh@nvidia.com, ktkhai@virtuozzo.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, mareklindner@neomailbox.ch, netdev@vger.kernel.org, pdeschrijver@nvidia.com, petrm@mellanox.com, sw@simonwunderlich.de, syzkaller-bugs@googlegroups.com, thierry.reding@gmail.com, treding@nvidia.com, tyhicks@canonical.com, xiyou.wangcong@gmail.com
List-Id: linux-tegra@vger.kernel.org

syzbot has bisected this bug to:

commit 96e5da7c842424bcf64afe1082b960b42b96190b
Author: Dmitry Osipenko <digetx@gmail.com>
Date:   Sun Oct 21 18:30:52 2018 +0000

     memory: tegra: Introduce Tegra20 EMC driver

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14450b93200000
start commit:   28e8c4bc Merge tag 'rtc-4.21' of git://git.kernel.org/pub/..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=16450b93200000
console output: https://syzkaller.appspot.com/x/log.txt?x=12450b93200000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c2ab9708c613a224
dashboard link: https://syzkaller.appspot.com/bug?extid=979ffc89b87309b1b94b
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17a93c4b400000

Reported-by: syzbot+979ffc89b87309b1b94b@syzkaller.appspotmail.com
Fixes: 96e5da7c8424 ("memory: tegra: Introduce Tegra20 EMC driver")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
