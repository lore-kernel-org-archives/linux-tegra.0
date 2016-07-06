From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [patch] drm/tegra: sor: Double free on error
Date: Wed, 6 Jul 2016 23:17:30 +0900
Message-ID: <CAAVeFuJhsGjGyK4Fk5qAk3jp9L5LnnuVCg8srwibg1hjWfvpEg@mail.gmail.com>
References: <20160704074501.GA4849@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20160704074501.GA4849@mwanda>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

T24gTW9uLCBKdWwgNCwgMjAxNiBhdCA0OjQ1IFBNLCBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVu
dGVyQG9yYWNsZS5jb20+IHdyb3RlOgo+ICJicmljayIgaXMgYWxsb2NhdGVkIHdpdGggZGV2bV9r
emFsbG9jKCkgc28gZnJlZWluZyBpdCB3aXRoIGtmcmVlKCkKPiBsZWFkcyB0byBhIGRvdWJsZSBm
cmVlLiAgV2UgY2FuIGp1c3QgZGVsZXRlIGl0LgoKVGhhdCBtYWtlcyBwZXJmZWN0IHNlbnNlLgoK
UmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBDb3VyYm90IDxhY291cmJvdEBudmlkaWEuY29tPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
