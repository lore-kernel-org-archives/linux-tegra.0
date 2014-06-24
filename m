From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 2/3] drm/ttm: introduce dma cache sync
	helpers
Date: Tue, 24 Jun 2014 19:55:12 +0900
Message-ID: <53A95910.20104@nvidia.com>
References: <1403603667-11302-1-git-send-email-acourbot@nvidia.com>
 <1403603667-11302-3-git-send-email-acourbot@nvidia.com>
 <20140624100220.GK32514@n2100.arm.linux.org.uk> <53A953E6.2030503@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <53A953E6.2030503-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

T24gMDYvMjQvMjAxNCAwNzozMyBQTSwgQWxleGFuZHJlIENvdXJib3Qgd3JvdGU6Cj4gT24gMDYv
MjQvMjAxNCAwNzowMiBQTSwgUnVzc2VsbCBLaW5nIC0gQVJNIExpbnV4IHdyb3RlOgo+PiBPbiBU
dWUsIEp1biAyNCwgMjAxNCBhdCAwNjo1NDoyNlBNICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3
cm90ZToKPj4+IEZyb206IEx1Y2FzIFN0YWNoIDxkZXZAbHlueGV5ZS5kZT4KPj4+Cj4+PiBPbiBh
cmNoaXRlY3R1cmVzIGZvciB3aGljaCBhY2Nlc3MgdG8gR1BVIG1lbW9yeSBpcyBub24tY29oZXJl
bnQsCj4+PiBjYWNoZXMgbmVlZCB0byBiZSBmbHVzaGVkIGFuZCBpbnZhbGlkYXRlZCBleHBsaWNp
dGx5IGF0IHRoZQo+Pj4gYXBwcm9wcmlhdGUgcGxhY2VzLiBJbnRyb2R1Y2UgdHdvIHNtYWxsIGhl
bHBlcnMgdG8gbWFrZSB0aGluZ3MKPj4+IGVhc3kgZm9yIFRUTS1iYXNlZCBkcml2ZXJzLgo+Pgo+
PiBIYXZlIHlvdSBydW4gdGhpcyB3aXRoIERNQSBBUEkgZGVidWdnaW5nIGVuYWJsZWQ/ICBJIHN1
c3BlY3QgeW91IGhhdmVuJ3QsCj4+IGFuZCBJIHJlY29tbWVuZCB0aGF0IHlvdSBkby4KPgo+ICMg
Y2F0IC9zeXMva2VybmVsL2RlYnVnL2RtYS1hcGkvZXJyb3JfY291bnQKPiAxNjI2MjEKPgo+ICji
la/CsOKWocKw77yJ4pWv77i1IOKUu+KUgeKUuykKCipwdXRzIHRhYmxlIGJhY2sgb24gaXRzIGZl
ZXQqCgpTbywgeWVhaCAtIFRUTSBtZW1vcnkgaXMgbm90IGFsbG9jYXRlZCB1c2luZyB0aGUgRE1B
IEFQSSwgaGVuY2Ugd2UgCmNhbm5vdCB1c2UgdGhlIERNQSBBUEkgdG8gc3luYyBpdC4gVGhhbmtz
IFJ1c3NlbGwgZm9yIHBvaW50aW5nIGl0IG91dC4KClRoZSBvbmx5IGFsdGVybmF0aXZlIEkgc2Vl
IGhlcmUgaXMgdG8gZmx1c2ggdGhlIENQVSBjYWNoZXMgd2hlbiBzeW5jaW5nIApmb3IgdGhlIGRl
dmljZSwgYW5kIGludmFsaWRhdGUgdGhlbSBmb3IgdGhlIG90aGVyIGRpcmVjdGlvbi4gT2YgY291
cnNlIAppZiB0aGUgZGV2aWNlIGhhcyBjYWNoZXMgb24gaXRzIHNpZGUgYXMgd2VsbCB0aGUgb3Bw
b3NpdGUgb3BlcmF0aW9uIG11c3QgCmFsc28gYmUgZG9uZSBmb3IgaXQuIEd1ZXNzIHRoZSBvbmx5
IHdheSBpcyB0byBoYW5kbGUgaXQgYWxsIGJ5IG91cnNlbHZlcyAKaGVyZS4gOi8KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxp
c3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
